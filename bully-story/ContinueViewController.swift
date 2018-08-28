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
        saveGlobalData()
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotoActOne(_ sender: Any) {
        loadGlobalData()
        empathymeter += 1
        self.present(ActViewController(title: "Day 2", subtitle: "The Beginning", time: "", quote: "\"Stand Up and Speak Out!\"", transitionTo: Scene3ViewController()), animated: false, completion: nil)
    }
    
    @IBAction func gotoActTwo(_ sender: Any) {
        loadGlobalData()
        empathymeter += 1
        self.present(ActViewController(title: "Day 3", subtitle: "", time: "", quote: "\"You have a voice\"", transitionTo: Scene5ViewController()), animated: true, completion: nil)
    }
    
    @IBAction func gotoActThree(_ sender: Any) {
        loadGlobalData()
        empathymeter += 1
        self.present(ActViewController(title: "Day 4", subtitle: "", time: "", quote: "\"You have a voice\"", transitionTo: Scene6ViewController()), animated: true, completion: nil)
    }
    
    @IBAction func gotoActFour(_ sender: Any) {
        loadGlobalData()
        empathymeter += 2
        self.present(ActViewController(title: "Day 100", subtitle: "The Act", time: "", quote: "\"Your silence are their weapon\"", transitionTo: Scene7ViewController()), animated: true, completion: nil)
    }
    
    @IBAction func gotoActFive(_ sender: Any) {
        loadGlobalData()
        empathymeter += 0
        print(empathymeter)
        self.present(ActViewController(title: "Day 101", subtitle: "", time: "", quote: "\"Courage is fire, and bullying is smoke.\"", transitionTo: Scene8ViewController()), animated: true, completion: nil)
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
