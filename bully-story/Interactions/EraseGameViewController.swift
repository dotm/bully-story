//
//  EraseGameViewController.swift
//  bully-story
//
//  Created by Cifran on 21/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit
import AVFoundation

private var bgAudio : AVAudioPlayer!

class EraseGameViewController: UIViewController {
    var swiped = false
    var lastPoint = CGPoint.zero
    lazy var brushWidth: CGFloat = {
        self.eraser.frame.height
    } ()
    var opacity: CGFloat = 1.0
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var strokeImageView: UIImageView!
    @IBOutlet weak var eraser: UIImageView!
    
    private var nextDialogVC: DialogViewController?
    
    convenience init() {
        self.init(nextDialogVC: nil)
    }
    
    init(nextDialogVC: DialogViewController?) {
        self.nextDialogVC = nextDialogVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let backgroundMusicData = NSDataAsset(name: "EraseGameBGM")?.data else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. */
            bgAudio = try AVAudioPlayer(data: backgroundMusicData, fileTypeHint: AVFileType.mp3.rawValue)
            
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
        } catch {
            print(error.localizedDescription)
        }
        
        bgAudio.numberOfLoops = -1
        bgAudio.play()
        strokeImageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    }
    override func viewDidDisappear(_ animated: Bool) {
        let duration = 1.0
        bgAudio.setVolume(0, fadeDuration: duration)
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { (_) in
            bgAudio.stop()
        }
        
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
        guard let touch = touches.first else { return }
        
        if eraser.frame.contains(touch.location(in: self.view)) {
            eraser.transform = .init(rotationAngle: CGFloat.pi / 5)
            swiped = false
            lastPoint = touch.location(in: self.view)
            isEraserOn = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            if isEraserOn {
                eraser.center = touch.location(in: self.view)
                let currentPoint = touch.location(in: self.view)
                drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
                lastPoint = currentPoint
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isEraserOn = false
        if testBool {
            eraser.transform = .identity
            if !swiped {
                drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
            }
            UIGraphicsBeginImageContext(view.frame.size)
            strokeImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: .clear, alpha: opacity)
            UIGraphicsEndImageContext()
            
            guard let averageColor = strokeImageView.image?.averageColor else {return}
            
            if averageColor.isEqual(UIColor(red: 0, green: 0, blue: 0, alpha: 0)) {
                testBool = false
                
                let transition = CATransition()
                transition.duration = 1
                transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
                transition.type = kCATransitionPush
                transition.subtype = kCATransitionFromRight
                self.view.window?.layer.add(transition, forKey: nil)
                self.present(self.nextDialogVC!, animated: false, completion: nil)
                
            }
        }
    }
    
    private var testBool = true
    private var isEraserOn = false
}

