//
//  Choice2ViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 11/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Choice2ViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            
            [
                 .setBackgroundImage(imageName: "classroom"),
                 .presentNarration(text: "You chose to ignore Jane. \n She's then preparing her things to study and you're preparing yours too."),
                
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "Jessica",
                    characterImagePosition: .left,
                    dialogText: "That girl is kind of pretty.."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "Teacher",
                    characterImagePosition: .left,
                    dialogText: "Hello everyone. Let's start our lesson today! Open your book at page 10 and do the little quiz there."
                ),
                ],
         
            [   .stopBGM(),
                .goToNextScene(viewController: Helper().getHangmanVC(dialogVC: self))],
            
            [
                .playBGM(filename: "Scene1BGMusic"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Yay! I got 100! How about you?"
                ),
                ],
            [
                .presentChoices(choices: (
                    title: "",
                    options: [
                        (
                            title: "I've got a good score as well!",
                            handler: { () in let nextEvent: Event? = self.events.goToNextEvent()
                                self.executeEvent(nextEvent)
                                
                                //self.goToNextScene(Scene6Choice1ViewController())
                                empathymeter += 1
                        }
                        ),
                        (
                            title: "Nah it's not that good...",
                            handler: { () in let nextEvent: Event? = self.events.goToNextEvent()
                                self.executeEvent(nextEvent)
                               
                        }                        ),
                        ]
                )),
                ],
            [
                .playBGM(filename: "Scene1BGMusic"),
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "Teacher",
                    characterImagePosition: .left,
                    dialogText: "Okay class dismissed! See you tomorrow everyone!"
                ),
                ],
            [.goToNextScene(viewController: ActViewController(title: "Day 1", subtitle: "Introduction", time: "Afternoon", quote: "\"You have a voice\"", transitionTo: Scene2ViewController()))],
            ]
        )
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}


