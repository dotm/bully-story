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
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet var placeholderCollection: [UIImageView]!
    private var pictureCollections : [UIImageView] = []
    
    var dialogVC: DialogViewController?
    var assetCode: Int?
    
    convenience init() {
        self.init(dialogVC: nil, assetCode: nil)
    }
    
    init(dialogVC: DialogViewController?, assetCode: Int?) {
        self.dialogVC = dialogVC
        self.assetCode = assetCode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.isHidden = true
        
        for i in 0...5 {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 130, height: 150))
//            imageView.image = UIImage(named: "puzzle-\(assetCode!)-\(i+1)")
            imageView.image = UIImage(named: "puzzle-1-\(i+1)")
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
//            placeholderCollection[i].backgroundColor = .clear
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
                    self.view.sendSubview(toBack: placeholderCollection[i])
                    
                    UIView.animate(withDuration: 0.4, animations: {
                        objectDragged?.frame = self.placeholderCollection[i].frame
                        objectDragged?.isUserInteractionEnabled = false
                        self.placeholderCollection[i].alpha = 0
                    }) { _ in
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
                
                UIView.animate(withDuration: 2.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    self.pictureCollections[0].transform = CGAffineTransform(translationX: 10, y: 26)
                    self.pictureCollections[1].transform = CGAffineTransform(translationX: -10, y: 26)
                    self.pictureCollections[2].transform = CGAffineTransform(translationX: 10, y: 0)
                    self.pictureCollections[3].transform = CGAffineTransform(translationX: -10, y: 0)
                    self.pictureCollections[4].transform = CGAffineTransform(translationX: 10, y: -26)
                    self.pictureCollections[5].transform = CGAffineTransform(translationX: -10, y: -26)
                    self.view.backgroundColor = .black
                }) { (_) in
                    self.nextBtn.isHidden = true
                }
            }
        }
    }
    
    @IBAction func onTapNextBtn(_ sender: Any) {
        let nextGame = PuzzleViewController(dialogVC: self.dialogVC, assetCode: self.assetCode!+1)
        if assetCode! < 4 {
            self.navigationController?.pushViewController(nextGame, animated: true)
        } else {
            self.dialogVC?.next()
            self.dismiss(animated: true)
        }
    }
    
}
