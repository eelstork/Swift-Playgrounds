
// Demonstrates how to create a CIImage from pixel data
// (uses CoreImage)

import UIKit

// Generate the data

let width         = 32
let height        = 32
let bytesPerPixel = 4
let pixelCount    = width*height
let c             = width*height*bytesPerPixel;

var array      = [UInt8](count:c, repeatedValue:0)

for index in 0...(pixelCount-1){
    array[index*4+0]=UInt8(index/5)
    array[index*4+1]=0
    array[index*4+2]=0
    array[index*4+3]=255
}

// Image parameters

let format          = kCIFormatRGBA8
let colorSpace      = CGColorSpaceCreateDeviceRGB()

// Linked variables

let bytesPerRow     = width*bytesPerPixel;
let size            = CGSize.init(width: width, height: height)

// Generate CIImage and UIImage
// (in a playground, use buttons in right-side margin to preview the result)

let data = NSData.init(bytes: array, length: array.count)
let coreImage = CIImage.init(bitmapData: data, bytesPerRow: bytesPerRow, size: size, format: format, colorSpace: colorSpace)
let imageViaCoreImage = UIImage.init(CIImage: coreImage)
