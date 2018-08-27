//
//  StartViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 09/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit
import AVKit

class StartViewController: UIViewController, UINavigationControllerDelegate {
    var bgAudio : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        // Do any additional setup after loading the view.
        guard let backgroundMusicData = NSDataAsset(name: "menuMusic")?.data else { return }
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
        
        bgAudio.play()
        bgAudio.numberOfLoops = -1
        // Do any additional setup after loading the view.
        
//        self.present(RepetitiveViewController(), animated: true, completion: nil)
//        self.present(FindItemViewController(nextDialogVC: Scene7Choice1ViewController()), animated: true, completion: nil)
//        self.present(HangmanViewController(), animated: true, completion: nil)
    }
    
    @IBAction func startGame(_ sender: Any) {
        bgAudio.stop()
        
        // prologue scene
        
        guard let path = Bundle.main.path(forResource: "video_prologue", ofType:"mp4") else { return }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        player.isMuted = true
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.view.isUserInteractionEnabled = false
        playerController.showsPlaybackControls = false
        
        let transition: CATransition = CATransition()
        transition.duration = 2
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromTop
        self.view.window!.layer.add(transition, forKey: nil)
        
        self.present(playerController, animated: false, completion: nil)
        
        DialogAudioPlayer.setAndPlay_SFX(mp3_filename: "MusicProlog", delay: 1)
        player.play()
        Timer.scheduledTimer(withTimeInterval: 15, repeats: false, block: { (_) in
            let transition = CATransition()
            transition.duration = 2
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            transition.type = kCATransitionFade
            transition.subtype = kCATransitionFromTop
            playerController.view.window!.layer.add(transition, forKey: nil)
           playerController.present(ActViewController(title: "Day 1", subtitle: "Introduction", time: "", quote: "\"Research indicates that persistent bullying can lead to suicidal behavior.\"", transitionTo: Scene1ViewController()), animated: false, completion: nil)
            
        })
        
    }
    @IBAction func gotoContinue(_ sender: UIButton) {
        bgAudio.stop()
    }
    
//    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return FadePushAnimator()
//    }
    
}
