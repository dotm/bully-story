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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = actTitle
        
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false) { (_) in
            self.navigationController?.pushViewController(self.destinationVC, animated: true)
        }
    }
}
