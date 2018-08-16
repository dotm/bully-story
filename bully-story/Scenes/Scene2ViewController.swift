//
//  Scene2ViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 11/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene2ViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Hi Jane! My name is Jessica.  Come join us to eat, we can talk more to get to know each other. I can also show you around school if you like."
                ),
                .setBackgroundImage(imageName: "yard"),
            ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Um.. I’d like to Jess. But i think i should go straight home. I need to this homework.."
                ),
                .setBackgroundImage(imageName: "yard"),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Oh? Okay. Fine then"
                ),
                .setBackgroundImage(imageName: "yard"),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Yeah Jess. See you tomorrow in class!"
                ),
                .setBackgroundImage(imageName: "yard"),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Yeah yeah sure."
                ),
                .setBackgroundImage(imageName: "yard"),
                ]
            
            
        ])

        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
