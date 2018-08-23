//
//  Scene8ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 21/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene8ViewController: DialogViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .stopBGM(),
                .playBGM(filename: "Scene8BGMusic"),
                .playSFX(filename: "SFXBellShort", delay: 0.0),
                .playSFX(filename: "Scene8SFXToilet", delay: 1.0),
                .setBackgroundImage(imageName : "wc"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile2",
                    characterImagePosition: .left,
                    dialogText: "Fiuh... finally. I've been holding that pee during the lesson."
                ),
                ],
            [
                .playSFX(filename: "Scene8SFXDoor1", delay: 0.0),
                .setBackgroundImage(imageName : "wc"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad3",
                    characterImagePosition: .left,
                    dialogText: "Wait.... What....?"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Shock",
                    characterImagePosition: .left,
                    dialogText: "Why won't it open?"
                ),
                ],
            [
                .playSFX(filename: "Scene8SFXGirlLaugh", delay: 0.0),
                .setBackgroundImage(imageName : "wc"),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Smug",
                    characterImagePosition: .right,
                    dialogText: "Hahaha..."
                ),
                
                ],
            [
                .playSFX(filename: "Scene8SFXDoor1", delay: 0.0),
                .setBackgroundImage(imageName : "wc"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Sad2",
                    characterImagePosition: .left,
                    dialogText: "Jessica? Is that you? Please help me open this door. I think i'm stuck here..."
                ),
                ],
            [
                .playSFX(filename: "Scene8SFXGirlLaugh", delay: 0.0),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Smug2",
                    characterImagePosition: .right,
                    dialogText: "Why don't you try to open it yourself? Bye bye I'm leaving for class!"
                ),
                ],
            [.presentDialog(
                characterName: "Jane",
                characterNamePosition: .left,
                characterImage: "Jane_Cry",
                characterImagePosition: .left,
                dialogText: "........."
                ),
             ],
            
            [
                .presentChoices(choices: (
                    title: "What would you do?",
                    options: [
                        (
                            title: "Confront Jessica",
                            handler: { () in
                                
                                self.goToNextScene(Scene8Choice1ViewController())
                                empathymeter += 1
                        }
                        ),
                        (
                            title: "Stand there watching and doing nothing",
                            
                            handler: { () in
                                self.goToNextScene(Scene8Choice2ViewController()) }
                        ),
                        ]
                )),
                ],
            
            
            
            ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
