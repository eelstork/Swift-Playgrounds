
import Foundatio

let rule = [
    Int(arc4random_uniform(5)), Int(arc4random_uniform(5)),
    Int(arc4random_uniform(5)), Int(arc4random_uniform(5)),
    Int(arc4random_uniform(5)), Int(arc4random_uniform(1)),
    Int(arc4random_uniform(5)), Int(arc4random_uniform(5)) ]

class Automata1D{
    
    var rule = [1, 0, 0, 0, 0, 1, 1, 1]
    var cells:[Int]
    
    /* Initialise with an arbitrary rule and pattern */
    init(){
        cells = [0, 0, 0, 1, 0, 0, 0]
    }
    
    /* Initialise with the specified cell count */
    init(count:Int){
        cells = [Int](count:count, repeatedValue: 0)
        cells[cells.count/2] = 1
    }
    
    /* Initialise with the specified rules and cell count */
    init(count:Int, rule:[Int]){
        self.rule = rule
        cells = [Int](count:count, repeatedValue: 0)
        cells[cells.count/2] = 1
    }
    
    /* Initialise with the specified rules and data */
    init(r:[Int], c:[Int]){
        rule = r
        cells = c
    }
    
    /* Step over */
    func step(){
        print("step")
        let c = cells.count
        var next = [Int](count:c, repeatedValue: 0)
        for i in 0...(c-1){
            let a = mod(i-1, div:c)
            let b = (i)
            let c = mod(i+1, div:c)
            let input = [ cells[a], cells[b], cells[c] ]
            let pattern = ( input[0] << 2 ) + ( input[1] << 1 ) + input[2]
            next[i] = rule[pattern]
            
        }
        cells=next;
    }
    
    func mod(a:Int, div:Int) -> Int{
        let r = a % div
        return r < 0 ? r + div : r;
    }
}

// =======================================================================

import UIKit

func toBitmap(data:[Int]) -> [UInt8]{
    
    var arr = [UInt8]()
    for i in 0...data.count-1{
        if (data[i]==0){
            arr+=[0,0,0,128]
        }else{
            arr+=[255,255,255,128]
        }
    }
    return arr;
    
}

func toImage(array:[UInt8], width:Int, height:Int) -> UIImage {
    
    // Image parameters
    
    let bytesPerPixel = 4
    let bitsPerComponent = 8
    let bitmapInfo       = CGBitmapInfo.ByteOrder16Big
    let colorSpace       = CGColorSpaceCreateDeviceRGB()
    
    // Linked Variables
    
    let bitsPerPixel  = 4*bitsPerComponent
    let bytesPerRow   = width*bytesPerPixel
    let byteCount     = bytesPerRow*height
    
    // Generate CIImage and UIImage
    // (in a playground, use buttons in right-side margin to preview the result)
    
    let provider = CGDataProviderCreateWithData(nil, array, byteCount, nil)
    
    let quartzImage = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpace, bitmapInfo, provider, nil, false, .RenderingIntentDefault)
    
    let imageViaCoreImage = UIImage.init(CGImage: quartzImage!)
    
    return imageViaCoreImage
    
}

// EXPERIMENT ============================================================

let instance = Automata1D(count:15)
var data = [Int]()
for _ in 0...31{
    instance.step()
    data+=instance.cells
}

let bitmap = toBitmap(data)
let image = toImage(bitmap,width: instance.cells.count,height: 32)



