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
    weak var dialogContainer: UIView!
    weak var dialogCharacterName: UITextView!
    weak var dialogText: UITextView!
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
    private func setupDialogContainer(){
        let dialogContainer = UIView()
        view.addSubview(dialogContainer)
        
        dialogContainer.backgroundColor = UIColor.red
        dialogContainer.layer.zPosition = 1
        
        dialogContainer.translatesAutoresizingMaskIntoConstraints = false
        dialogContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dialogContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        dialogContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        dialogContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        self.dialogContainer = dialogContainer
    }
    let dialogContainerPadding = CGFloat(10)
    let dialogContainer_separatorBetween_characterName_andDialogText = CGFloat(50)
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
        
        dialogCharacterName.translatesAutoresizingMaskIntoConstraints = false
        dialogCharacterName.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: dialogContainerPadding).isActive = true
        dialogCharacterName.topAnchor.constraint(equalTo: parent.topAnchor, constant: dialogContainerPadding).isActive = true
        dialogCharacterName.bottomAnchor.constraint(equalTo: parent.topAnchor, constant: dialogContainer_separatorBetween_characterName_andDialogText).isActive = true
        dialogCharacterName.widthAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 0.6).isActive = true
        
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
        
        dialogText.translatesAutoresizingMaskIntoConstraints = false
        dialogText.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: dialogContainerPadding).isActive = true
        dialogText.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -dialogContainerPadding).isActive = true
        dialogText.topAnchor.constraint(equalTo: parent.topAnchor, constant: dialogContainer_separatorBetween_characterName_andDialogText).isActive = true
        dialogText.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -dialogContainerPadding).isActive = true
        
        self.dialogText = dialogText
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
