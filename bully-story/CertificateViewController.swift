//
//  CertificateViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 27/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class CertificateViewController: UIViewController {
    private weak var certificateImage: UIImage! = UIImage(named: "certificate")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "warnamain")
        setupImageView()
        setupSaveButton()
    }
    private func setupImageView(){
        let imageView = UIImageView()
        imageView.image = certificateImage
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        let multiplier = CGFloat(0.3)
        imageView.heightAnchor.constraint(equalToConstant: certificateImage.size.height * multiplier).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: certificateImage.size.width * multiplier).isActive = true
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
        UIImageWriteToSavedPhotosAlbum(self.certificateImage, nil, nil, nil)
        UIApplication.shared.open(URL(string:"photos-redirect://")!, options: [:], completionHandler: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
