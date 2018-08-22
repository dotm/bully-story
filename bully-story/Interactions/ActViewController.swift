//
//  ActViewController.swift
//  bully-story
//
//  Created by Cifran on 15/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class ActViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    var actTitle = ""
    var destinationVC: UIViewController!
    
    convenience init() {
        self.init(title: "", transitionTo: nil)
    }
    
    init(title: String, transitionTo destinationVC: UIViewController?) {
        self.actTitle = title
        self.destinationVC = destinationVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = actTitle
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let transition: CATransition = CATransition()
        transition.duration = 2
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromTop
        self.view.window!.layer.add(transition, forKey: nil)
        
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false) { (_) in
            self.present(self.destinationVC, animated: false, completion: nil)
        }
    }
}
