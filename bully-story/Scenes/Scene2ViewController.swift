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
                .playSFX(filename: "Scene1Bell", delay: 0.0),
                .playBGM(filename: "Scene2BGMusic"),
                .setBackgroundImage(imageName : "halaman"),
                .presentNarration(text: "School is finally over. Jane is walking straight home because she wants to do the homework that was given earlier today. Jessica came up to her to ask her to play with her gang. "),
                
                ],
            [
                .playSFX(filename: "Scene2SFX", delay: 0.0),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "Jessica_Smile",
                    characterImagePosition: .left,
                    dialogText: "Hi Jane! My name is Jessica.  Come join us to eat, we can talk more to get to know each other. I can also show you around school if you like!"
                ),
                .setBackgroundImage(imageName: "halaman"),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .right,
                    characterImage: "Jane_Persevere",
                    characterImagePosition: .right,
                    dialogText: "Um.. I’d like to Jess. But i think i should go straight home. I need to this homework.."
                ),
                .setBackgroundImage(imageName: "halaman"),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "Jessica",
                    characterImagePosition: .left,
                    dialogText: "Oh? Okay. Fine then"
                ),
                .setBackgroundImage(imageName: "halaman"),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .right,
                    characterImage: "Jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Yeah Jess. See you tomorrow in class!"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "Jessica_Unamused",
                    characterImagePosition: .left,
                    dialogText: "Yeah yeah sure."
                ),
                .setBackgroundImage(imageName: "halaman"),
                ],
            [.playBGM(filename: "Scene2Narration(intense)")],
            [
                
                .presentNarration(text: "Jessica looks pissed because no one ever says no to her. All girls want to befriend with her because of her popularity. This is the first time someone says no to her"),
                
                ],
            [
                    .presentDialog(
                        characterName: "Jessica",
                        characterNamePosition: .left,
                        characterImage: "Jessica_Angry",
                        characterImagePosition: .left,
                        dialogText: "Gee.. that new girl. How dare she says no to me? Who does she think she is?"
                    ),
                    .setBackgroundImage(imageName: "halaman"),
                    ],
             [.goToNextScene(viewController: Scene3ViewController())],
            
            
            ])
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
