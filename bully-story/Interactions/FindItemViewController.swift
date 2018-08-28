//
//  FindItemViewController.swift
//  bully-story
//
//  Created by Cifran on 21/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation
import CoreMotion

private var bgAudio : AVAudioPlayer!

class FindItemViewController: UIViewController {
    
    private var scrollView: UIScrollView!
//    private var imageView: UIView!
    private var imageView: FindItemImageView!
//    private var lostItemImageView: UIImageView!
    private var lostItemShadowImageView: UIImageView!
    
    private var closingView1: UIView!
    private var closingView2: UIView!
    private var janeImageView: UIImageView!
    
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
        guard let backgroundMusicData = NSDataAsset(name: "HangmanBGMusic")?.data else { return }
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
        
        //calculate position of lost item based on backgroundImage frame
            // x, y, width, height
        
        //create a blank view with above frame
        //create tap recognizer
        //create animation if tapped
            // scaling to big
        //kalo salah geter
        
        let bookImg = Helper().resizeImage(image: UIImage(named: "find_book")!, targetSize: CGSize(width: 100, height: 100))
        
//        imageView = UIImageView(image: UIImage(named: "find_bg1"))
        imageView = FindItemImageView(frame: CGRect(x: 0, y: 0, width: 1280, height: 960))
        
        for item in imageView.items {
            let tap = UITapGestureRecognizer(target: self, action: #selector(userTapOtherItem(_:)))
            item.isUserInteractionEnabled = true
            item.addGestureRecognizer(tap)
        }
        let pan = UIPanGestureRecognizer(target: self, action: #selector(userTapLostBook(_:)))
        let tap = UITapGestureRecognizer(target: self, action: #selector(userTapLostBook(_:)))
        imageView.lostBook.isUserInteractionEnabled = true
        imageView.lostBook.addGestureRecognizer(pan)
        imageView.lostBook.addGestureRecognizer(tap)
        
//        lostItemImageView = UIImageView(image: bookImg)
        lostItemShadowImageView = UIImageView(image: bookImg)
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = .flexibleWidth
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        
        self.scrollView.addSubview(imageView)    //background
        self.view.addSubview(scrollView)
        self.view.addSubview(lostItemShadowImageView)
//        self.view.addSubview(lostItemImageView)
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -44).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        
        lostItemShadowImageView.translatesAutoresizingMaskIntoConstraints = false
        lostItemShadowImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        lostItemShadowImageView.topAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 40).isActive = true

//        lostItemImageView.isUserInteractionEnabled = true
//        lostItemImageView.alpha = 0
//        lostItemImageView.backgroundColor = .clear
        
        lostItemShadowImageView.image = bookImg.withRenderingMode(.alwaysTemplate)
        lostItemShadowImageView.tintColor = .lightGray
        
        closingView1 = UIView(frame: CGRect(x: 0, y: 0, width: self.scrollView.frame.width, height: 0))
        closingView1.backgroundColor = .white
        closingView2 = UIView(frame: CGRect(x: 0, y: self.scrollView.frame.height, width: self.scrollView.frame.width, height: 0))
        closingView2.backgroundColor = .white
        
        janeImageView = UIImageView(image: UIImage(named: "Jane_Sad2"))
        janeImageView.alpha = 0
        janeImageView.center = scrollView.center
        janeImageView.transform = .init(scaleX: 0.3, y: 0.3)
        
        self.view.addSubview(closingView1)
        self.view.addSubview(closingView2)
        self.view.addSubview(janeImageView)
        
    
//        let motionManager = CMMotionManager()
//        if motionManager.isDeviceMotionAvailable {
//            motionManager.startDeviceMotionUpdates()
////            var data = motionManager.deviceMotion
//            print("device motion available")
//            motionManager.deviceMotionUpdateInterval = 0.1
//            motionManager.startDeviceMotionUpdates(
//                to: OperationQueue.current!, withHandler: {
//                    (deviceMotion, error) -> Void in
//                    if(error == nil) {
//                        self.handleDeviceMotionUpdate(deviceMotion: deviceMotion!)
//                    } else {
//                        print(error)
//                    }
//            })
//                motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
//                motionManager.showsDeviceMovementDisplay = true
//                motionManager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
//
//                // Configure a timer to fetch the motion data.
//                let timer = Timer(fire: Date(), interval: 0.1, repeats: true, block: { (timer) in
////                    print(motionManager.deviceMotion)
//                    if let data = motionManager.deviceMotion {
//                        // Get the attitude relative to the magnetic north reference frame.
//                        let x = data.attitude.pitch * 30
//                        let y = data.attitude.roll * 30
////                        let z = data.attitude.yaw
//
//                        // Use the motion data in your app.
//                        let pos = self.scrollView.contentOffset
//                        let newPos = CGPoint(x: Double(pos.x)+x, y: Double(pos.y)+y)
//                        print("old \(pos)")
//                        print("new \(newPos)")
//                        self.scrollView.setContentOffset(newPos, animated: true)
//                    }
//                })
//
//                // Add the timer to the current run loop.
//                RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
//        } else {
//            print("device motion not available")
//        }
    }
    
//    func handleDeviceMotionUpdate(deviceMotion:CMDeviceMotion) {
//        var attitude = deviceMotion.attitude
//        var roll = degrees(radians: attitude.roll)
//        var pitch = degrees(radians: attitude.pitch)
//        var yaw = degrees(radians: attitude.yaw)
//        print("Roll: \(roll), Pitch: \(pitch), Yaw: \(yaw)")
//    }
//
//    func degrees(radians:Double) -> Double {
//        return 180 / Double.pi * radians
//    }
    
    @objc func userTapOtherItem(_ gesture: UITapGestureRecognizer) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    private var canPickBook = true
    
    @objc func userTapLostBook(_ gesture: UITapGestureRecognizer) {
        if canPickBook {
            canPickBook = false
            let copyImage = UIImageView()
            let bookImg = Helper().resizeImage(image: UIImage(named: "find_book")!, targetSize: CGSize(width: 100, height: 100))
            imageView.lostBook.isHidden = true
            copyImage.image = bookImg
            copyImage.frame = scrollView.convert(imageView.lostBook.frame, to: self.view)
            
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(userGiveBookToJane(_:)))
            copyImage.isUserInteractionEnabled = true
            copyImage.addGestureRecognizer(panGesture)
            
            self.view.addSubview(copyImage)
            self.scrollView.isUserInteractionEnabled = false
            
            UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseOut, animations: {
                copyImage.center = self.lostItemShadowImageView.center
            }) { _ in
    //            self.lostItemShadowImageView.isHidden = true
                self.view.bringSubview(toFront: self.lostItemShadowImageView)
                self.view.bringSubview(toFront: copyImage)
                self.lostItemShadowImageView.alpha = 1
                
                self.shadowTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                    UIView.animate(withDuration: 1, animations: {
                        self.lostItemShadowImageView.transform = .init(translationX: 0, y: -50)
                        self.lostItemShadowImageView.alpha = 0.5
                    }) { _ in
                        self.lostItemShadowImageView.transform = .identity
                        self.lostItemShadowImageView.alpha = 1
                    }
                })
            }
        }
    }
    
    private var shadowTimer: Timer?

    @objc func userGiveBookToJane(_ gesture: UIPanGestureRecognizer) {
        shadowTimer?.invalidate()
        lostItemShadowImageView.alpha = 0
        if canMove {
            guard let book = gesture.view else { return }
            book.layer.removeAllAnimations()
            
            let oldCenterY = book.center.y
            book.center = CGPoint(x: book.center.x, y: gesture.location(in: self.view).y)
            
            let transitionY = (oldCenterY - book.center.y) * 2
            
            closingView1.frame = CGRect(x: 0,
                                   y: 0,
                                   width: closingView1.frame.width,
                                   height: closingView1.frame.height + transitionY)
            closingView2.frame = CGRect(x: 0,
                                   y: closingView2.frame.origin.y - transitionY,
                                   width: closingView2.frame.width,
                                   height: closingView2.frame.height + transitionY)
            
            var progress = closingView1.frame.height / scrollView.frame.height
            progress = progress > 1 ? 1 : progress
            progress = progress < 0 ? 0 : progress
            
            switch progress {
            case 0 ..< 0.01:
                janeImageView.alpha = 0
            case 0.01 ..< 0.3 :
                janeImageView.alpha = progress*2 + 0.1
            case 0.3 ..< 0.4:
                janeImageView.alpha = 1
                janeImageView.image = UIImage(named: "Jane_Sad2")
            case 0.4 ..< 0.5:
                janeImageView.image = UIImage(named: "Jane_Sad3")
            case 0.5 ..< 0.6:
                janeImageView.image = UIImage(named: "Jane_Shock")
            case 0.6 ..< 0.8:
                janeImageView.image = UIImage(named: "Jane_Smile")
            default:
                break
            }
            if self.janeImageView.frame.intersects(book.frame) {
                canMove = false
                UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
                    book.center = self.janeImageView.center
                    book.alpha = 0
                    self.janeImageView.image = UIImage(named: "Jane_Smile2")
                }) { (_) in
                    let transition = CATransition()
                    transition.duration = 1
                    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
                    transition.type = kCATransitionPush
                    transition.subtype = kCATransitionFromRight
                    self.view.window?.layer.add(transition, forKey: nil)
                    self.present(self.nextDialogVC!, animated: false)
                }
            }
        }
        
    }
    
    var canMove = true
    
    
//    @objc func lostItemFound(_ gesture: UITapGestureRecognizer) {
//        let itemFrame = self.lostItemImageView.frame
//        let tapPoint = gesture.location(in: self.imageView)
//
//        if itemFrame.contains(tapPoint) {
//            self.lostItemImageView.alpha = 1
//            self.scrollView.isUserInteractionEnabled = false
//
//            UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseOut, animations: {
//                self.lostItemImageView.center = self.lostItemShadowImageView.center
//            })
//        } else {
//            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
//        }
//    }

}
