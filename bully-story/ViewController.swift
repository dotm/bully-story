//
//  ViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 09/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var dialogCharacterName: UILabel!
    @IBOutlet weak var dialogText: UITextView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }

    //MARK: Actions
    @IBAction func next(_ sender: UITapGestureRecognizer? = nil) {
        let nextEvent: Event? = events.goToNextEvent()
        executeEvent(nextEvent)
    }
    
    //MARK: Private methods (helpers)
    private func executeEvent(_ event: Event?){
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
        }
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
}

