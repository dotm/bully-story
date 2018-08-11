//
//  DialogViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 11/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class DialogViewController: UIViewController {
    //MARK: Properties
    var events: Events!
    var defaultBackgroundColor: UIColor { return UIColor.cyan }
    var dialogTextBackgroundColor: UIColor { return defaultBackgroundColor }
    var characterNameBackgroundColor: UIColor { return defaultBackgroundColor }
    
    var dialogTextFontStyle: UIFont {return UIFont.systemFont(ofSize: 16)}
    var characterNameFontStyle: UIFont {return UIFont.systemFont(ofSize: 20)}
    
    //MARK: Outlets
    weak var dialogCharacterName: UITextView!
    weak var dialogText: UITextView!
    weak var backgroundImage: UIImageView!
    
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDialogText()
        setupCharacterName()
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
        case let .setDialogCharacterName(name):
            dialogCharacterName.text = name
        case let .setDialogText(text):
            dialogText.text = text
        case let .setBackgroundImage(imageName):
            changeBackgroundImage(imageName)
        case let .presentChoices(choices):
            presentChoices(choices)
        case let .goToNextScene(viewController):
            goToNextScene(viewController)
        case let .displayDialog(show):
            displayDialog(show)
        }
    }
    func displayDialog(_ show: Bool){
        if show {
            dialogText.alpha = 1
            dialogCharacterName.alpha = 1
        } else {
            dialogText.alpha = 0
            dialogCharacterName.alpha = 0
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
    private func setupDialogText() {
        // Do any additional setup after loading the view, typically from a nib.
        let dialogText = UITextView()
        view.addSubview(dialogText)
        
        dialogText.layer.zPosition = 1
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
        
        dialogText.translatesAutoresizingMaskIntoConstraints = false
        dialogText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dialogText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        dialogText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        dialogText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        dialogText.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.7).isActive = true
        
        self.dialogText = dialogText
    }
    private func setupCharacterName() {
        let dialogCharacterName = UITextView()
        view.addSubview(dialogCharacterName)
        
        dialogCharacterName.layer.zPosition = 1
        dialogCharacterName.isUserInteractionEnabled = false
        dialogCharacterName.isScrollEnabled = false
        dialogCharacterName.text = "Firstname Lastname"
        dialogCharacterName.font = characterNameFontStyle
        dialogCharacterName.backgroundColor = characterNameBackgroundColor
        dialogCharacterName.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        dialogCharacterName.translatesAutoresizingMaskIntoConstraints = false
        dialogCharacterName.bottomAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.7).isActive = true
        dialogCharacterName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        dialogCharacterName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        
        self.dialogCharacterName = dialogCharacterName
    }
    private func setupBackgroundImage(){
        let backgroundImage = UIImageView()
        view.addSubview(backgroundImage)
        
        backgroundImage.layer.zPosition = 0
        backgroundImage.image = UIImage(named: "placeholderImage")
        
        backgroundImage.frame = view.frame
        
        self.backgroundImage = backgroundImage
    }
    private func setupTapGestureRecognizer(){
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(next(_:)))
        view.addGestureRecognizer(recognizer)
    }
}
