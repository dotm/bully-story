//
//  CertificateViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 27/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class CertificateViewController: UIViewController {
    private var certificateImage = UIImage(named: "certificate")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "warnamain")
        setupImageView()
        
        setupSaveButton()
        setupHomeButton()
    }
    private func setupImageView(){
        let imageView = UIImageView()
        imageView.image = certificateImage
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        let multiplier = CGFloat(0.3)
        imageView.heightAnchor.constraint(equalToConstant: certificateImage!.size.height * multiplier).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: certificateImage!.size.width * multiplier).isActive = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            UIView.animate(withDuration: 2, animations: {
                imageView.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
            })
        })
    }
    
    
    private func setupSaveButton(){
        let button = UIButton()
        button.backgroundColor = UIColor(named: "purple")
        button.titleEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20)
        button.layer.cornerRadius = CGFloat(10)
        button.setTitle("Save Certificate Image", for: .normal)
        button.addTarget(self, action: #selector(saveCertificateImage), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
    }
    @objc func saveCertificateImage(){
        UIImageWriteToSavedPhotosAlbum(self.certificateImage!, nil, nil, nil)
        UIApplication.shared.open(URL(string:"photos-redirect://")!, options: [:], completionHandler: nil)
    }
    
    
    @objc func gotoMainMenu(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homePage = storyboard.instantiateViewController(withIdentifier: "home") as! UINavigationController
        DialogAudioPlayer.stopBackgroundMusic()
        DialogAudioPlayer.stopSoundEffect()
        self.present(homePage, animated: true, completion: nil)
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
        button.addTarget(self, action: #selector(gotoMainMenu(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -35).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        //        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

}
