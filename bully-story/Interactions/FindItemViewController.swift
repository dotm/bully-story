//
//  FindItemViewController.swift
//  bully-story
//
//  Created by Cifran on 21/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class FindItemViewController: UIViewController {
    @IBOutlet weak var lostItem: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    var lostItemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //calculate position of lost item based on backgroundImage frame
            // x, y, width, height
        
        //create a blank view with above frame
        //create tap recognizer
        //create animation if tapped
            // scaling to big
        //kalo salah geter
        
        imageView = UIImageView(image: UIImage(named: "classroom"))
        lostItemImageView = UIImageView(image: UIImage(named: "ans_correct"))
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = .flexibleWidth
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -44).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
    }

}
