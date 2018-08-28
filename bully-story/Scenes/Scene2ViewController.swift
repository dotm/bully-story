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
                .presentMonolog(text: "School is finally over. I see Jessica came up to Jane to ask her to play with her gang. "),
                
                ],
            [
                .playSFX(filename: "Scene2SFX", delay: 0.0),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Smile",
                    characterImagePosition: .right,
                    dialogText: "Hi Jane, I'm Jessica! Come join us for lunch! We can talk more to get to know each other."
                ),
                .setBackgroundImage(imageName: "halaman"),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Smile",
                    characterImagePosition: .right,
                    dialogText: "I can also show you around school if you like!"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Persevere",
                    characterImagePosition: .left,
                    dialogText: "Um.. I’d like to Jess. But i think i should go straight home. I need do to this homework.."
                ),
                .setBackgroundImage(imageName: "halaman"),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica",
                    characterImagePosition: .right,
                    dialogText: "Oh? Okay. Fine then."
                ),
                .setBackgroundImage(imageName: "halaman"),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "Yeah Jess. Maybe next time. See you tomorrow in class!"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Unamused",
                    characterImagePosition: .right,
                    dialogText: "Yeah yeah sure."
                ),
                .setBackgroundImage(imageName: "halaman"),
                ],
            [
                .playBGM(filename: "Scene2Narration(intense)"),
                .presentMonolog(text: "I can see from the look on Jessica's face that she is pissed because no one ever says no to her."),
                
                ],
            [
                .presentMonolog(text: "All girls want to befriend with her because of her popularity."),
                
                ],
            [
                    .presentDialog(
                        characterName: "Jessica",
                        characterNamePosition: .right,
                        characterImage: "Jessica_Angry",
                        characterImagePosition: .right,
                        dialogText: "Gee.. that new girl. How dare she says \"no\" to me? Who does she think she is?"
                    ),
                    .setBackgroundImage(imageName: "halaman"),
                    ],
            [.goToNextScene(viewController: ActViewController(title: "Day 2", subtitle: "The Beginning", time: "", quote: "\"Envy is sometimes at the root of bullying behaviors.\"", transitionTo: Scene3ViewController()))],
            
            
            ])
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
