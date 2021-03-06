//
//  RepetitiveViewController.swift
//  bully-story
//
//  Created by Rayo Roderik on 24/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class RepetitiveViewController: UIViewController {
    @IBOutlet weak var dayCount: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var janeImage: UIImageView!
    private var timerObject: Timer?
    var currentDay = 4
    var timerTime = 1.5
    var timertotal = 0.0
    var imageNum = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .purple
        
        countStart()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        changeBG()
    }

    private func changeBG(){
        UIView.animate(withDuration: 16.1, animations: {
           self.view.backgroundColor = .black
        }) { (nil) in
            print("hehe")
        }
    }
    
    private func countStart(){
        timerObject = Timer.scheduledTimer(withTimeInterval: timerTime, repeats: false) { (_) in
            self.currentDay += 1
            self.timertotal += self.timerTime
            print(self.timertotal)
            if self.timerTime >= 0.1{
                self.timerTime -= 0.1
            }
            else{
                self.timerTime = 0.1
            }
            
            if self.imageNum < 4{
                self.imageNum += 1
            }
            else if self.imageNum == 4 {
                self.imageNum = 1
            }
            
            var imageName = ""
            if self.imageNum == 1 {
                imageName = "puzzle1.png"
            }
            else if self.imageNum == 2{
                imageName = "puzzle2.png"
            }
            else if self.imageNum == 3{
                imageName = "puzzle3.png"
            }
            else if self.imageNum == 4{
                imageName = "puzzle4.png"
            }
            
//            let randomNum = (drand48() * 2) - 1
            let randomNum = Float.pi * (Float(arc4random_uniform(50))/100) 
            print(randomNum)
            
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            
            self.view.addSubview(imageView)
            
            self.dayCount.layoutIfNeeded()
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            
            imageView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant : 120).isActive = true
            imageView.layoutIfNeeded()
            
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            imageView.transform = imageView.transform.rotated(by: CGFloat(randomNum))
            imageView.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
            imageView.contentMode = UIViewContentMode.scaleAspectFill
    
            
            self.dayCount.text = "Day \(self.currentDay)"
            if self.currentDay < 99{
                self.countStart()
            }
            else {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                   
                    let image = UIImage(named: "Jane_black")
                    let imageView = UIImageView(image: image!)
                    self.view.addSubview(imageView)
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    
                    
                    imageView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant : 120).isActive = true
                    imageView.layoutIfNeeded()
                    
                    imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                    imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
                    imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
                    
                    
                    imageView.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
                    imageView.contentMode = UIViewContentMode.scaleAspectFill
                   
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                        
                    UIView.animate(withDuration: 2, animations: {
                        imageView.transform = CGAffineTransform(scaleX: 1.9, y: 1.9)
                    }, completion: { (true) in
                        self.nextButton.superview?.bringSubview(toFront: self.nextButton)
                        self.nextButton.isHidden = false
                    })
                    })
                })
                
            
                
                
                
                self.countStop()
            }
        }
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        self.present(Scene5bViewController(), animated: false, completion: nil)
    }
    private func countStop() {
        timerObject?.invalidate()
        
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

