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
    private var timerObject: Timer?
    var currentDay = 4
    var timerTime = 1.5
    var imageNum = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countStart()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func countStart(){
        timerObject = Timer.scheduledTimer(withTimeInterval: timerTime, repeats: false) { (_) in
            self.currentDay += 1
            
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
            
            let randomNum = (drand48() * 2) - 1
            
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            
            self.view.addSubview(imageView)
            
            self.dayCount.layoutIfNeeded()
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            
            imageView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant : 120).isActive = true
            imageView.layoutIfNeeded()
            print("ini bottom anchor = \(imageView.frame.minY)")
            
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            imageView.transform = imageView.transform.rotated(by: CGFloat(randomNum))
            imageView.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
            imageView.contentMode = UIViewContentMode.scaleAspectFill
            
            
            
//
            
            self.dayCount.text = "Day \(self.currentDay)"
            if self.currentDay < 99{
                self.countStart()
            }
            else {
                self.countStop()
            }
        }
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

