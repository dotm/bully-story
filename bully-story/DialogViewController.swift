//
//  DialogViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 11/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
    
        if ((cString.count) != 6) {
            self.init(
                red: 0,
                green: 0,
                blue: 0,
                alpha: 1
            )
        }else{
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
        
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }
    }
}

class DialogViewController: UIViewController {
    //MARK: Properties
    var events: Events!
    var defaultBackgroundColor: UIColor { return UIColor(hex: "D2DAF6") }
    var dialogTextBackgroundColor: UIColor { return defaultBackgroundColor }
    var characterNameBackgroundColor: UIColor { return defaultBackgroundColor }
    var borderColor = UIColor(hex: "979797")
    let borderWidth = CGFloat(1)
    
    var dialogTextFontStyle: UIFont {return UIFont.systemFont(ofSize: 16)}
    var characterNameFontStyle: UIFont {return UIFont.boldSystemFont(ofSize: 20)}
    
    //MARK: Outlets
    weak var dialogContainer: UIView!
    weak var dialogCharacterName: UITextView!
    weak var dialogTextView: UITextView!
    weak var backgroundImage: UIImageView!
    
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDialogContainer()
        setupDialogText(parent: dialogContainer)
        setupCharacterName(parent: dialogContainer)
        setupBackgroundImage()
        setupTapGestureRecognizer()
    }
    
    //MARK: Actions
    @objc func next(_ sender: UITapGestureRecognizer? = nil) {
        let nextEvent: Event? = events.goToNextEvent()
        executeEvent(nextEvent)
    }
    
    //MARK: Private methods (helpers)
    func executeEvent(_ event: Event?){
        guard event != nil else {
            return
        }
        for action in event! {
            executeAction(action)
        }
    }
    private func executeAction(_ action: StoryAction){
        switch action {
        case let .setBackgroundImage(imageName):
            changeBackgroundImage(imageName)
        case let .presentChoices(choices):
            presentChoices(choices)
        case let .goToNextScene(viewController):
            goToNextScene(viewController)
        case let .presentDialog(characterName, dialogText):
            dialogCharacterName.text = characterName
            dialogTextView.text = dialogText
        }
    }
    func goToNextScene(_ viewController: UIViewController){
        self.present(viewController, animated: true, completion: nil)
    }
    private func changeBackgroundImage(_ newImageName: String){
        UIView.transition(with: backgroundImage, duration: 1, options: .transitionCrossDissolve, animations: {
            self.backgroundImage.image = UIImage(named: newImageName)
        }, completion: nil)
    }
    private func presentChoices(_ choices: Choices){
        let alert = UIAlertController(
            title: choices.title,
            message: choices.message,
            preferredStyle: .actionSheet
        )
        
        for option in choices.options {
            alert.addAction(
                UIAlertAction(
                    title: option.title,
                    style: .default,
                    handler: option.handler
                )
            )
        }
        
        present(alert, animated: true) {
            self.next()
        }
    }
    
    //MARK: Layout setup
    private func setupDialogContainer(){
        let dialogContainer = UIView()
        view.addSubview(dialogContainer)
        
        dialogContainer.backgroundColor = UIColor(hex: "7C8FCD")
        dialogContainer.layer.zPosition = 1
        
        dialogContainer.translatesAutoresizingMaskIntoConstraints = false
        dialogContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dialogContainer.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        dialogContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.30).isActive = true
        dialogContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.dialogContainer = dialogContainer
    }
    let dialogContainerPadding = CGFloat(10)
    private func setupCharacterName(parent: UIView) {
        let dialogCharacterName = UITextView()
        parent.addSubview(dialogCharacterName)
        
        dialogCharacterName.layer.zPosition = 2
        dialogCharacterName.isUserInteractionEnabled = false
        dialogCharacterName.isScrollEnabled = false
        dialogCharacterName.text = "Firstname Lastname"
        dialogCharacterName.font = characterNameFontStyle
        dialogCharacterName.backgroundColor = characterNameBackgroundColor
        dialogCharacterName.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        dialogCharacterName.layer.borderColor = borderColor.cgColor
        dialogCharacterName.layer.borderWidth = borderWidth
        dialogCharacterName.layer.cornerRadius = 10
        dialogCharacterName.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        dialogCharacterName.translatesAutoresizingMaskIntoConstraints = false
        dialogCharacterName.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: dialogContainerPadding).isActive = true
        dialogCharacterName.bottomAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        dialogCharacterName.widthAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 0.4).isActive = true
        
        self.dialogCharacterName = dialogCharacterName
    }
    private func setupDialogText(parent: UIView) {
        let dialogText = UITextView()
        parent.addSubview(dialogText)
        
        dialogText.layer.zPosition = 2
        dialogText.isUserInteractionEnabled = false
        dialogText.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        dialogText.setContentOffset(CGPoint.zero, animated: false)
        dialogText.text = """
        Lorem ipsum dolor sit amet, te duo tale putant reformidans, ex ius salutandi ocurreret, malis laoreet ex eum.
        Te diam iuvaret scribentur pri, qui regione oportere temporibus cu.
        In cum nostrum phaedrum maiestatis, pro ei ludus sanctus minimum. Eum paulo putant minimum ad, eos eu probo everti posidonium.
        """
        dialogText.backgroundColor = dialogTextBackgroundColor
        dialogText.font = dialogTextFontStyle
        dialogText.layer.cornerRadius = 10
        dialogText.layer.borderColor = borderColor.cgColor
        dialogText.layer.borderWidth = borderWidth
        
        dialogText.translatesAutoresizingMaskIntoConstraints = false
        dialogText.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: dialogContainerPadding).isActive = true
        dialogText.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -dialogContainerPadding).isActive = true
        dialogText.topAnchor.constraint(equalTo: parent.topAnchor, constant: dialogContainerPadding).isActive = true
        dialogText.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -dialogContainerPadding).isActive = true
        
        self.dialogTextView = dialogText
    }
    private func setupBackgroundImage(){
        let backgroundImage = UIImageView()
        view.addSubview(backgroundImage)
        
        backgroundImage.layer.zPosition = 0
        backgroundImage.image = UIImage(named: "placeholderImage")
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.70).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        self.backgroundImage = backgroundImage
    }
    private func setupTapGestureRecognizer(){
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(next(_:)))
        view.addGestureRecognizer(recognizer)
    }
}
