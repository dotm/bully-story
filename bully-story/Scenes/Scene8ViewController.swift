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
                .playSFX(filename: "SFXBellShort", delay: 0.0),
                .playSFX(filename: "SFXToilet", delay: 1.0),
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
                .playSFX(filename: "SFXDoor1", delay: 0.0),
                .setBackgroundImage(imageName : "wc"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad3",
                    characterImagePosition: .left,
                    dialogText: "Wait.... What....?"
                ),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Shock",
                    characterImagePosition: .left,
                    dialogText: "Why won't it open?"
                ),
                ],
            [
                .presentChoices(choices: (
                    title: "What would you do?",
                    options: [
                        (
                            title: "Help Jane to find her book",
                            //ke yg cari barang, akhirannya Jane blg thankyou
                            handler: { () in
                                
                                self.goToNextScene(Scene7Choice1ViewController())
                                empathymeter += 1
                        }
                        ),
                        (
                            title: "Ignore Her",
                            
                            handler: { () in
                                self.goToNextScene(Scene7Choice2ViewController()) }
                        ),
                        ]
                )),
                ],
            
            
            
            ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
