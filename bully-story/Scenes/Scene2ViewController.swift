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
                .setBackgroundImage(imageName : "yard"),
                .presentNarration(text: "School is finally over. Jane is walking straight home because she wants to do the homework that was given earlier today. Jessica came up to her to ask her to play with her gang. "),
                
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Hi Jane! My name is Jessica.  Come join us to eat, we can talk more to get to know each other. I can also show you around school if you like!"
                ),
                .setBackgroundImage(imageName: "yard"),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .right,
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
                    characterNamePosition: .right,
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
                ],
            [
                .presentNarration(text: "Jessica looks pissed because no one ever says no to her. All girls want to befriend with her because of her popularity. This is the first time someone says no to her"),
                
                ],
            [
                    .presentDialog(
                        characterName: "Jessica",
                        characterNamePosition: .left,
                        characterImage: "jane_Smile",
                        characterImagePosition: .left,
                        dialogText: "Gee.. that new girl. How dare she says no to me? Who does she think she is?"
                    ),
                    .setBackgroundImage(imageName: "yard"),
                    ],
            
            
            ])
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
