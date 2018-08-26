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
//    private var imageView: UIView!
    private var imageView: FindItemImageView!
//    private var lostItemImageView: UIImageView!
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
        
        let bookImg = Helper().resizeImage(image: UIImage(named: "find_book")!, targetSize: CGSize(width: 100, height: 100))
        
//        imageView = UIImageView(image: UIImage(named: "find_bg1"))
        imageView = FindItemImageView(frame: CGRect(x: 0, y: 0, width: 1280, height: 960))
        
        for item in imageView.items {
            let tap = UITapGestureRecognizer(target: self, action: #selector(userTapOtherItem(_:)))
            item.isUserInteractionEnabled = true
            item.addGestureRecognizer(tap)
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(userTapLostBook(_:)))
        imageView.lostBook.isUserInteractionEnabled = true
        imageView.lostBook.addGestureRecognizer(tap)
        
//        lostItemImageView = UIImageView(image: bookImg)
        lostItemShadowImageView = UIImageView(image: bookImg)
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = .flexibleWidth
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        
        self.scrollView.addSubview(imageView)    //background
        self.view.addSubview(scrollView)
        self.view.addSubview(lostItemShadowImageView)
//        self.view.addSubview(lostItemImageView)
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -44).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        
        lostItemShadowImageView.translatesAutoresizingMaskIntoConstraints = false
        lostItemShadowImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        lostItemShadowImageView.topAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 40).isActive = true

//        lostItemImageView.isUserInteractionEnabled = true
//        lostItemImageView.alpha = 0
//        lostItemImageView.backgroundColor = .clear
        
        lostItemShadowImageView.image = bookImg.withRenderingMode(.alwaysTemplate)
        lostItemShadowImageView.tintColor = .lightGray
        
    }
    
    @objc func userTapOtherItem(_ gesture: UITapGestureRecognizer) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    @objc func userTapLostBook(_ gesture: UITapGestureRecognizer) {
        let copyImage = UIImageView()
        let bookImg = Helper().resizeImage(image: UIImage(named: "find_book")!, targetSize: CGSize(width: 100, height: 100))
        imageView.lostBook.isHidden = true
        copyImage.image = bookImg
        copyImage.frame = scrollView.convert(imageView.lostBook.frame, to: self.view)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(userGiveBookToJane(_:)))
        copyImage.isUserInteractionEnabled = true
        copyImage.addGestureRecognizer(panGesture)
        
        
        self.view.addSubview(copyImage)
        
        UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseOut, animations: {
            copyImage.center = self.lostItemShadowImageView.center
        })
        self.scrollView.isUserInteractionEnabled = false
    }
    
    @objc func userGiveBookToJane(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        
//        var newYScale = 1 + (translation.y / self.scrollView.frame.height)
//        if newYScale < 0 {
//            newYScale = 0
//        }
//        self.scrollView.transform = .init(scaleX: 1, y: newYScale)
        guard let book = gesture.view else { return }
        book.center = CGPoint(x: book.center.x, y: gesture.location(in: self.view).y)
        
        var newHeight = translation.y + self.scrollView.frame.height
        newHeight = newHeight < 0 ? 0 : newHeight
        
        if newHeight == 0 {
            book.isUserInteractionEnabled = false
        }
        let oldCenter = self.scrollView.center
        
        var newFrame = self.scrollView.frame
        newFrame.size = CGSize(width: scrollView.frame.width, height: newHeight)
        self.scrollView.frame = newFrame
        self.scrollView.center = oldCenter
        
        print(newFrame)
    }
    
    
    
//    @objc func lostItemFound(_ gesture: UITapGestureRecognizer) {
//        let itemFrame = self.lostItemImageView.frame
//        let tapPoint = gesture.location(in: self.imageView)
//
//        if itemFrame.contains(tapPoint) {
//            self.lostItemImageView.alpha = 1
//            self.scrollView.isUserInteractionEnabled = false
//
//            UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseOut, animations: {
//                self.lostItemImageView.center = self.lostItemShadowImageView.center
//            })
//        } else {
//            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
//        }
//    }

}
