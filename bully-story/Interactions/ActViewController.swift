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
    var actTitle = ""
    var destinationVC: UIViewController!
    var subtitleString = ""
    var quoteString = ""
    
    convenience init() {
        self.init(title: "", subtitle: "", quote: "", transitionTo: nil)
    }
    
    init(title: String, subtitle: String, quote: String, transitionTo destinationVC: UIViewController?) {
        self.actTitle = title
        self.destinationVC = destinationVC
        self.subtitleString = subtitle
        self.quoteString = quote
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { (_) in
            let transition = CATransition()
            transition.duration = 2
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            transition.type = kCATransitionFade
            transition.subtype = kCATransitionFromTop
            self.view.window!.layer.add(transition, forKey: nil)
            self.present(self.destinationVC, animated: false, completion: nil)
        }
    }
}
