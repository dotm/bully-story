//
//  Extensions.swift
//  bully-story
//
//  Created by Cifran on 22/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

extension UIImage {
    //    func getPixelColor(pos: CGPoint) -> UIColor {
    //
    //        let pixelData =  self.cgImage!.dataProvider!.data
    //        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
    //
    //        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
    //
    //        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
    //        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
    //        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
    //        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
    //
    //        return UIColor(red: r, green: g, blue: b, alpha: a)
    //    }
    //
    //    func getPixelColors() {
    //        let pixelData =  self.cgImage!.dataProvider!.data
    //        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
    //        for pixelInfo in 0...Int(self.size.width * self.size.height) {
    //            let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
    //            let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
    //            let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
    //            let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
    //
    //            let color = UIColor(red: r, green: g, blue: b, alpha: a)
    //            print(color)
    //            if color.cgColor.alpha != 0 { return }
    //            if color.cgColor.components![0] != 0 { return }
    //            if color.cgColor.components![1] != 0 { return }
    //            if color.cgColor.components![2] != 0 { return }
    //        }
    //    }
    
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)
        
        guard let filter = CIFilter(name: "CIAreaAverage", withInputParameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }
        
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [kCIContextWorkingColorSpace: kCFNull])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: kCIFormatRGBA8, colorSpace: nil)
        
        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}
