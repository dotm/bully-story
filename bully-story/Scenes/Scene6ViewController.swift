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
                .setBackgroundImage(imageName: "classroom"),
                .playSFX(filename: "Scene1Bell", delay: 0.0),
                .playBGM(filename: "Scene6BGMusic"),
               
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
                    characterImage: "jane_Sad",
                    characterImagePosition: .left,
                    dialogText: "What happened to my table..."
                ),
                ],
            [
                .playSFX(filename: "Scene6SFXLaugh", delay: 0.0),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Oh look guys! The new girl is messing with the table!"
                ),
                
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Sad",
                    characterImagePosition: .left,
                    dialogText: "But.. but.. I didn't do this.."
                ),
               
                ],
            [
                .playSFX(filename: "Scene6SFXLaugh2", delay: 0.0),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Well it's on your table though. How else would you explain it?"
                ),
               
                ],
            [
                .playSFX(filename: "Scene6SFXNo", delay: 0.0),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Sad2",
                    characterImagePosition: .left,
                    dialogText: "..................."
                ),
                
                ],
            [
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
