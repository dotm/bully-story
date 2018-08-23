//
//  Scene1ViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 09/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene1ViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        //dapit
        events = Events(events: [
            [
                .setBackgroundImage(imageName: "classroom"),
                .playBGM(filename: "Scene1BGMusic"),
                .playSFX(filename: "Scene1Bell", delay: 3.0),
                
                .presentNarration(text: "(Bell Rang) Each students returned to their seat. The teacher came in and brought a girl with him. "),
                ],
            [
                .presentNarration(text: "Looks like it’s the new girl. She has a very pretty face and very charming."),
                ],
            [
                    .presentNarration(text: "She also looks very excited with smile all over her face. All eyes are on her, especially the boys."),
                    ],
            [
                .presentNarration(text: "She chose to sit beside you."),
                ],
            [
                        .playBGM(filename: "Scene1BGMusic2"),
                        .presentChoices(choices: (
                            title: "Jane sat beside you. What would you do?",
                            options: [
                                (
                                    title: "Introduce yourself",
                                    handler: { () in self.goToNextScene(Scene2ViewController())
//                                        empathymeter += 1
//                                        print(empathymeter)
                                }
                                ),
                                
                                ]
                        )),
            ],
            
        ])
        let startEvent = events.goToStartEvent()
        
        executeEvent(startEvent)
    }
}
