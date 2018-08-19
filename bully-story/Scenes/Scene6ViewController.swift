//
//  Scene5ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 19/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene6ViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .playSFX(filename: "Scene1Bell", delay: 0.0),
                .playBGM(filename: "Scene2BGMusic"),
                .setBackgroundImage(imageName : "classroom"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "What....."
                ),
                ],
            [
                
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "What happened to my table..."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Oh look guys! The new girl is messing with the table!"
                ),
                .setBackgroundImage(imageName: "yard"),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "But.. but.. I didn't do this.."
                ),
                .setBackgroundImage(imageName: "yard"),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Well it's on your table though. How else would you explain it?"
                ),
                .setBackgroundImage(imageName: "yard"),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "..................."
                ),
                .setBackgroundImage(imageName: "yard"),
                ],
            [
                .playBGM(filename: "Scene1BGMusic2"),
                .presentChoices(choices: (
                    title: "What would you do?",
                    options: [
                        (
                            title: "Help Jane to clean her table",
                            //ke yg hapus hapus, akhirannya Jane blg thankyou
                            handler: { () in
                                
                                self.goToNextScene(Scene6Choice1ViewController()) }
                        ),
                        (
                            title: "Ignore Her",
                            
                            handler: { () in self.goToNextScene(Scene6Choice2ViewController()) }
                        ),
                        ]
                )),
                ],
            ])
            let startEvent = events.goToStartEvent()
            executeEvent(startEvent)
            }
}
