//
//  EraseGameViewController.swift
//  bully-story
//
//  Created by Cifran on 21/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class EraseGameViewController: UIViewController {
    var swiped = false
    var lastPoint = CGPoint.zero
    var brushWidth: CGFloat = 100.0
    var opacity: CGFloat = 1.0
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var strokeImageView: UIImageView!
    
    private var dialogVC: DialogViewController?
    
    convenience init() {
        self.init(dialogVC: nil)
    }
    
    init(dialogVC: DialogViewController?) {
        self.dialogVC = dialogVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strokeImageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
         UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        strokeImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
        context?.setLineCap(.round)
        context?.setLineWidth(brushWidth)
        context?.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        context?.setBlendMode(.clear)
        context?.strokePath()
        
        strokeImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        strokeImageView.alpha = 1
        UIGraphicsEndImageContext()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
        }
        UIGraphicsBeginImageContext(view.frame.size)
        strokeImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: .clear, alpha: opacity)
        UIGraphicsEndImageContext()
        
        guard let averageColor = strokeImageView.image?.averageColor else {return}
        
        if averageColor.isEqual(UIColor(red: 0, green: 0, blue: 0, alpha: 0)) {
            self.dialogVC?.next()
            let transition: CATransition = CATransition()
            transition.duration = 1
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            self.view.window!.layer.add(transition, forKey: nil)
            self.dismiss(animated: true)
        }
    }
}

