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
                .setBackgroundImage(imageName: "classroom"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "Hi there. I’m Jane. What’s your name?"
                ),
            ],[
                .goToNextScene(viewController: Helper().getInputNameVC(dialogVC: self))
            ],[
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile2",
                    characterImagePosition: .left,
                    dialogText: "Hello, #name. This school looks really nice. Looking forward to more days here!"
                ),
            ],[
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "Jessica",
                    characterImagePosition: .left,
                    dialogText: "That girl is kind of pretty..."
                ),
            ],[
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .right,
                    characterImage: "Teacher",
                    characterImagePosition: .right,
                    dialogText: "Hello everyone. Let's start our lesson today! "
                ),
            ],[
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .right,
                    characterImage: "Teacher",
                    characterImagePosition: .right,
                    dialogText: "Open your book at page 10 and do the little quiz there."
                ),
                ],[   .stopBGM(),
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
                    .presentDialog(
                        characterName: "Jane",
                        characterNamePosition: .left,
                        characterImage: "Jane_Smile2",
                        characterImagePosition: .left,
                        dialogText: "Either way it's okay! You've done a good job!"
                    ),
                    ],
                  [
                    .presentDialog(
                        characterName: "Jessica",
                        characterNamePosition: .left,
                        characterImage: "Jessica_Angry",
                        characterImagePosition: .left,
                        dialogText: "....She seems smart too."
                    ),
                    ],
                  [
                    .presentDialog(
                        characterName: "Teacher",
                        characterNamePosition: .left,
                        characterImage: "Teacher",
                        characterImagePosition: .left,
                        dialogText: "Okay class dismissed! See you tomorrow everyone!"
                    ),
                    ],
                  [.goToNextScene(viewController: ActViewController(title: "Day 1", subtitle: "Introduction", time: "Noon", quote: "\"You have a voice\"", transitionTo: Scene2ViewController()))],
                  ]
        )
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}


