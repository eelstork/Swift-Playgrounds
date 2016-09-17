
// Demonstrates how to create a CGImage from pixel data
// (uses CoreGraphics / Quartz)

import UIKit

let bytesPerPixel = 4

// Generate the data
func CreateImage1() -> [UInt8] {
    
    let width         = 32
    let height        = 32
    let pixelCount    = width*height
    let c             = width*height*bytesPerPixel;
    var array      = [UInt8](count:c, repeatedValue:0)
    for index in 0...(pixelCount-1){
        array[index*4+0]=UInt8(index/5)
        array[index*4+1]=0
        array[index*4+2]=0
        array[index*4+3]=255
    }
    return array;

}

// Generate the data
func CreateImage2() -> [[[UInt8]]] {
    
    var data = [[[UInt8]]].init(count:32, repeatedValue:
        [[UInt8]].init(count:32, repeatedValue:
            [UInt8](count:4, repeatedValue:9)))
    
    for x in 0...31{
        for y in 0...31{
            for z in 0...3{
                data[y][x][z] = 255
            }
        }
    }
    
    return data;
    
}

func toUIImage(array: [UInt8], width:Int, height: Int) -> UIImage{
    
    // Image parameters
    
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
    
    return UIImage.init(CGImage: quartzImage!)
    
}

func toUIImage(array: [[[UInt8]]] ) -> UIImage{
    
    let height = array.count
    let width = array[0].count
    
    // Image parameters
    
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
    
    return UIImage.init(CGImage: quartzImage!)
    
}

let array = CreateImage1()
let image = toUIImage(array, width: 32, height: 32)

let array2 = CreateImage2()
let image2 = toUIImage(array2);



