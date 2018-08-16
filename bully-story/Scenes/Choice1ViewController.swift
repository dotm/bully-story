//
//  Choice1ViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 11/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

var username: NSString!

class Choice1ViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let inputNameVC = InputNameViewController()
        inputNameVC.providesPresentationContextTransitionStyle = true
        inputNameVC.definesPresentationContext = true
        inputNameVC.modalPresentationStyle = .overCurrentContext
        inputNameVC.prevVC = self
        inputNameVC.username = username
        
        events = Events(events: [
            [
                .setBackgroundImage(imageName: "classroom"),
                .presentDialog(
                    characterName: "Jean",
                    characterNamePosition: .left,
                    characterImage: "jane_Sad",
                    characterImagePosition: .left,
                    dialogText: "Hi there. I’m Jane. What’s your name?"
                ),
            ], [
                .goToNextScene(viewController: inputNameVC)
            ], [
                .presentDialog(
                    characterName: "Jean",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "Hello, \(username). This school looks really nice. Looking forward to more days here!"
                ),
            ], [
                .presentNarration(text: "From the other side of the class, Jessica is staring at Jane cynically. She realise Jane is very pretty and might be a threat for her popularity."),
            ], [
                .presentNarration(text: "The lesson started, they all studied quietly. At the end of the class the teacher gave them homework for them to do."),
                    
            ], [
                .goToNextScene(viewController: Scene2ViewController())],
            ]
        )
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}


