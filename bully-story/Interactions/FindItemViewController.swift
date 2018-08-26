//
//  FindItemViewController.swift
//  bully-story
//
//  Created by Cifran on 21/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit
import AudioToolbox

class FindItemViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var imageView: UIImageView!
    private var lostItemImageView: UIImageView!
    private var lostItemShadowImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //calculate position of lost item based on backgroundImage frame
            // x, y, width, height
        
        //create a blank view with above frame
        //create tap recognizer
        //create animation if tapped
            // scaling to big
        //kalo salah geter
        
        imageView = UIImageView(image: UIImage(named: "find_bg1"))
        lostItemImageView = UIImageView(image: UIImage(named: "find_book"))
        lostItemShadowImageView = UIImageView(image: UIImage(named: "find_book"))
        
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
        
        
        self.view.addSubview(lostItemShadowImageView)
        lostItemShadowImageView.translatesAutoresizingMaskIntoConstraints = false
        lostItemShadowImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        lostItemShadowImageView.topAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 40).isActive = true
//        lostItemShadowImageView.widthAnchor.constraint(equalTo: lostItemImageView.widthAnchor).isActive = true
//        lostItemShadowImageView.heightAnchor.constraint(equalTo: lostItemImageView.heightAnchor).isActive = true
        
        lostItemImageView.isUserInteractionEnabled = true
        imageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(lostItemFound(_:)))
        imageView.addGestureRecognizer(tap)
        
        lostItemImageView.alpha = 0
        lostItemImageView.backgroundColor = .clear
        imageView.addSubview(lostItemImageView)
        
    }
    
    @objc func lostItemFound(_ gesture: UITapGestureRecognizer) {
        let itemFrame = self.lostItemImageView.frame
        let tapPoint = gesture.location(in: self.imageView)
        
        if itemFrame.contains(tapPoint) {
            self.lostItemImageView.alpha = 1
            self.scrollView.isUserInteractionEnabled = false
//            self.imageView.removeGestureRecognizer(gesture)
            
            UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.lostItemImageView.center = self.lostItemShadowImageView.center
            })
        } else {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
    }

}
