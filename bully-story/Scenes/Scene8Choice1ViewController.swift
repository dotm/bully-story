//
//  Scene7Choice1ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 21/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene8Choice1ViewController: DialogViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .playBGM(filename: "Scene8RightChoice"),
                .setBackgroundImage(imageName : "wc"),
                .presentDialog(
                    characterName: "#name",
                    characterNamePosition: .left,
                    characterImage: "",
                    characterImagePosition: .left,
                    dialogText: "Hey Jessica!"
                ),
                ],
            [
                
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica",
                    characterImagePosition: .right,
                    dialogText: "Any problem #name?"
                ),
                ],
            [
                .presentChoices(choices: (
                    title: "What would you do?",
                    options: [
                        (
                            title: "Yes, why are you doing this to Jane?",
                            handler: { () in
                                
                                self.goToNextScene(Scene8Choice1AViewController())
                                empathymeter += 1
                        }
                        ),
                        (
                            title: "No nothing Jessica..",
                            
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
