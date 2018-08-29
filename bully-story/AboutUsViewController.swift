//
//  AboutUsViewController.swift
//  bully-story
//
//  Created by Cifran on 28/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeButton()
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
        button.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -35).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        //        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    @objc func goToHome() {
        self.performSegue(withIdentifier: "unwind", sender: nil)
    }

}
