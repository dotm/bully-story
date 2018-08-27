//
//  Scene7ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 19/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene7ViewController: DialogViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .playSFX(filename: "Scene1Bell", delay: 0.0),
                .playBGM(filename: "Scene2BGMusic"),
                .setBackgroundImage(imageName : "classroom"),
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .right,
                    characterImage: "Teacher",
                    characterImagePosition: .right,
                    dialogText: "Good morning everyone. We will start our lesson today. Please open your book now."
                ),
                ],
            [
                .playBGM(filename: "Scene7BGMusic"),
                .playSFX(filename: "Scene7SFXHuh", delay: 0.0),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Shock",
                    characterImagePosition: .left,
                    dialogText: "Wait.. where's my book.. I'm pretty sure i brought it this morning.."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .right,
                    characterImage: "Teacher",
                    characterImagePosition: .right,
                    dialogText: "What's the matter Jane?"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad",
                    characterImagePosition: .left,
                    dialogText: "No it's just.. i can't find my book now... I don't know where did it go..."
                ),
                ],
            [
                .playSFX(filename: "Scene7SFXReally", delay: 0.0),
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .right,
                    characterImage: "Teacher_Angry",
                    characterImagePosition: .right,
                    dialogText: "Are you telling me you didn't bring your book to my class?!"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad2",
                    characterImagePosition: .left,
                    dialogText: "No madam... I'm really sure i brought it this morning."
                ),
                ],
            [
                .playSFX(filename: "Scene7SFXLaugh3", delay: 0.0),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica",
                    characterImagePosition: .right,
                    dialogText: "Then why can't you find it if you're that sure?"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad",
                    characterImagePosition: .left,
                    dialogText: "..................."
                ),
                
                ],
            [
            .presentMonolog(text: "I'm pretty sure it's Jessica who is behind this. So I decided to.... ")],
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
