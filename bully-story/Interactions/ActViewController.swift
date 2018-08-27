//
//  ActViewController.swift
//  bully-story
//
//  Created by Cifran on 15/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class ActViewController: UIViewController {
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var actTitle = ""
    var destinationVC: UIViewController!
    var subtitleString = ""
    var quoteString = ""
    var timeString = ""
    
    convenience init() {
        self.init(title: "", subtitle: "", time: "", quote: "", transitionTo: nil)
    }
    
    init(title: String, subtitle: String, time: String, quote: String, transitionTo destinationVC: UIViewController?) {
        self.actTitle = title
        self.destinationVC = destinationVC
        self.subtitleString = subtitle
        self.quoteString = quote
        self.timeString = time
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = actTitle
        subtitle.text = subtitleString
        quote.text = quoteString
        quote.alpha = 0
        timeLabel.text = timeString
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if timeString == "Afternoon"{
            self.view.backgroundColor = .orange
        }
        
        let duration_toNextScene = 6.0
        UIView.animateKeyframes(withDuration: duration_toNextScene, delay: 0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                self.quote.alpha = 1
            })
        }) { (complete) in
            let transition = CATransition()
            transition.duration = 1.5
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            transition.type = kCATransitionFade
            transition.subtype = kCATransitionFromTop
            self.view.window?.layer.add(transition, forKey: nil)
            self.present(self.destinationVC, animated: false, completion: nil)
        }
    }
}
