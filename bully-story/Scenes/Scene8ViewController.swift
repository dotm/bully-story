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
                .playSFX(filename: "Scene1Bell", delay: 0.0),
                .playBGM(filename: "Scene2BGMusic"),
                .setBackgroundImage(imageName : "classroom"),
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .right,
                    characterImage: "teacher",
                    characterImagePosition: .right,
                    dialogText: "Good morning everyone. We will start our lesson today. Please open your book now."
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
