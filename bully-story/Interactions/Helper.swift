//
//  Helper.swift
//  bully-story
//
//  Created by Cifran on 17/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

struct Helper {
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func getPuzzleVC(dialogVC: DialogViewController) -> UIViewController {
        let puzzleVC = PuzzleViewController(dialogVC: dialogVC, assetCode: 1)
        let navVC = UINavigationController(rootViewController: puzzleVC)
        navVC.isNavigationBarHidden = true
        return navVC
    }
    
    
    func getInputNameVC(dialogVC: DialogViewController) -> UIViewController {
        let inputNameVC = InputNameViewController()
        inputNameVC.providesPresentationContextTransitionStyle = true
        inputNameVC.definesPresentationContext = true
        inputNameVC.modalPresentationStyle = .overCurrentContext
        inputNameVC.prevVC = dialogVC
        return inputNameVC
    }
    
    func getHangmanVC(dialogVC: DialogViewController) -> UIViewController {
        return HangmanViewController(dialogVC: dialogVC)
    }
    
    func getEraseGameVC(dialogVC: DialogViewController) -> UIViewController {
        return EraseGameViewController()
    }
    
    
}