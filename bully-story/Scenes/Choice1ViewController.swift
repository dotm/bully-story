//
//  Choice1ViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 11/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Choice1ViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .presentDialog(
                    characterName: "Jean",
                    characterNamePosition: .left,
                    characterImage: "jane_Sad",
                    characterImagePosition: .left,
                    dialogText: "Hi there. I’m Jane. What’s your name?"
                ),
                .setBackgroundImage(imageName: "backgroundImage"),
                ],
            [
                .presentDialog(
                    characterName: "###",
                    characterNamePosition: .right,
                    characterImage: nil,
                    characterImagePosition: .left,
                    dialogText: "Input Name"
                ),
                .setBackgroundImage(imageName: "backgroundImage2"),
                ],  [
                    .presentDialog(
                        characterName: "Jean",
                        characterNamePosition: .left,
                        characterImage: "jane_Smile",
                        characterImagePosition: .right,
                        dialogText: "Hello, #name. This school looks really nice. Looking forward to more days here!"
                    ),
                    .setBackgroundImage(imageName: "backgroundImage"),
                    ]])
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}


