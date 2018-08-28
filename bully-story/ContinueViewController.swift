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
        setupHomeButton()
        navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func gotoActOne(_ sender: Any) {
        loadGlobalData()
        empathymeter += 1
        self.present(ActViewController(title: "Day 2", subtitle: "The Beginning", time: "", quote: "\"Stand Up and Speak Out!\"", transitionTo: Scene3ViewController()), animated: false, completion: nil)
    }
    
    @IBAction func gotoActTwo(_ sender: Any) {
        loadGlobalData()
        empathymeter += 1
        self.present(ActViewController(title: "Day 3", subtitle: "The Target", time: "", quote: "\"You have a voice\"", transitionTo: Scene5ViewController()), animated: false, completion: nil)
    }
    
    @IBAction func gotoActThree(_ sender: Any) {
        loadGlobalData()
        empathymeter += 1
        self.present(ActViewController(title: "Day 4", subtitle: "The Struggle", time: "", quote: "\"You have a voice\"", transitionTo: Scene6ViewController()), animated: false, completion: nil)
    }
    
    @IBAction func gotoActFour(_ sender: Any) {
        loadGlobalData()
        empathymeter += 2
        self.present(ActViewController(title: "Day 100", subtitle: "The Act", time: "", quote: "\"Your silence are their weapon\"", transitionTo: Scene7ViewController()), animated: false, completion: nil)
    }
    
    @IBAction func gotoActFive(_ sender: Any) {
        loadGlobalData()
        empathymeter += 0
        print(empathymeter)
        self.present(ActViewController(title: "Day 101", subtitle: "The Finale", time: "", quote: "\"Courage is fire, and bullying is smoke.\"", transitionTo: Scene8ViewController()), animated: false, completion: nil)
    }
    
    @IBAction func gotoMainMenu(_ sender: Any) {
        self.performSegue(withIdentifier: "unwind", sender: nil)
    }
    
    
    private func setupHomeButton(){
        let button = UIButton()
        button.layer.zPosition = 20
        button.backgroundColor = UIColor(named:"purple-light")
        //        button.titleEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3)
        button.layer.cornerRadius = CGFloat(10)
        //        button.setTitle("Home", for: .normal)
        let img = Helper().resizeImage(image: UIImage(named: "home")!, targetSize: CGSize(width: 15, height: 15)).withRenderingMode(.alwaysTemplate)
        button.setImage(img, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(gotoMainMenu(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -35).isActive = true
        //        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

}
