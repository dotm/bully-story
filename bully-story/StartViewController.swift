//
//  StartViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 09/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit
import AVFoundation

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
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startGame(_ sender: Any) {
        bgAudio.stop()
        
        self.navigationController?.delegate = self
        let vc = ActViewController()
        vc.actTitle = "Act 1"
        vc.destinationVC = Scene1ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadePushAnimator()
    }
    
}
