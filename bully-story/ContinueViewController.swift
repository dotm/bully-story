//
//  ContinueViewController.swift
//  bully-story
//
//  Created by Rayo Roderik on 27/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit
import AVKit

class ContinueViewController: UIViewController {
    
    var bgAudio : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotoActOne(_ sender: Any) {
        self.present(ActViewController(title: "Day 1", subtitle: "Introduction", time: "Day", quote: "\"Research indicates that persistent bullying can lead to suicidal behavior.\"", transitionTo: Scene6Choice2ViewController()), animated: false, completion: nil)
    }
    
    @IBAction func gotoActTwo(_ sender: Any) {
        self.present(RepetitiveViewController(), animated: true, completion: nil)
    }
    
    @IBAction func gotoActThree(_ sender: Any) {
        self.present(Scene1ViewController(), animated: true, completion: nil)
    }
    
    @IBAction func gotoActFour(_ sender: Any) {
        self.present(Scene1ViewController(), animated: true, completion: nil)
    }
    
    @IBAction func gotoMainMenu(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
