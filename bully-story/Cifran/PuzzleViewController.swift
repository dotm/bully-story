//
//  PuzzleViewController.swift
//  bully-story
//
//  Created by Cifran on 15/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class PuzzleViewController: UIViewController {
    
    // 1 2
    // 3 4
    // 5 6
    
    @IBOutlet var placeholderCollection: [UIImageView]!
    private var pictureCollections : [UIImageView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...5 {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 130, height: 150))
            imageView.image = UIImage(named: "puzzle-\(i+1)")
            self.view.addSubview(imageView)
            pictureCollections.append(imageView)
            
            // Scatter pictures
            imageView.frame.origin.x = CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width - imageView.frame.width)))
            imageView.frame.origin.y = CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.height - imageView.frame.height)))
            imageView.isUserInteractionEnabled = true
            
            let drag = UIPanGestureRecognizer(target: self, action: #selector(dragPicture))
            imageView.addGestureRecognizer(drag)
            
            imageView.tag = i
            placeholderCollection[i].tag = i
            placeholderCollection[i].backgroundColor = .clear
        }
    }
    
    private func closeEnough(_ a: Int, _ b: Int) -> Bool {
        let radius = 100
        return (b >= a - radius && b <= a + radius)
    }
    
    private func isRightPlace(_ placeholder: UIView, _ object: UIView) -> Bool {
        return (closeEnough(Int(placeholder.frame.origin.x), Int(object.frame.origin.x))
            && closeEnough(Int(placeholder.frame.origin.y), Int(object.frame.origin.y))
            && placeholder.tag == object.tag)
    }
    
    @objc func dragPicture(sender: UIPanGestureRecognizer) {
        let dragLocation = sender.location(in: view)
        let objectDragged = sender.view
        view.bringSubview(toFront: objectDragged!)
        
        objectDragged?.center = dragLocation
        
        if (sender.state == .cancelled || sender.state == .ended) {
            for i in 0 ... 5 {
                if isRightPlace(placeholderCollection[i], objectDragged!) {
                    self.view.sendSubview(toBack: objectDragged!)
                    UIView.animate(withDuration: 0.2) {
                        objectDragged?.frame = self.placeholderCollection[i].frame
                        objectDragged?.isUserInteractionEnabled = false
                        self.snapCount += 1
                    }
                    break
                }
            }
        }
    }
    
    private var snapCount = 0 {
        didSet {
            if snapCount == placeholderCollection.count {
                self.view.backgroundColor = .black
            }
        }
    }

}
