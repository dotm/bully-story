//
//  InputNameViewController.swift
//  bully-story
//
//  Created by Cifran on 16/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class InputNameViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    var prevVC: DialogViewController?
    var username: NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.becomeFirstResponder()
        self.view.backgroundColor = UIColor(white: 0.4, alpha: 0.8)
        self.textField.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.dismiss(animated: true, completion: {
            self.prevVC?.next()
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.username = textField.text! as NSString
        self.textField.resignFirstResponder()
        return true
    }
    
    

}
