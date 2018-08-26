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
                .playSFX(filename: "Scene1Bell", delay: 2.0),
                
                .presentNarration(text: "(Bell Rang) First day of school today. I came to the class and pick any empty seat. After a while, the teacher came in and i saw a girl walking behind him. "),
                ],
            [
                .presentNarration(text: "Looks like it’s the new girl. She has a very pretty face and very charming."),
                ],
            [
                    .presentNarration(text: "She also looks very excited with smile all over her face. All eyes are on her, especially the boys."),
                    ],
            [
                .presentNarration(text: "She chose to sit beside me."),
                ],
            [
                        .playBGM(filename: "MusicScene1"),
                        .presentChoices(choices: (
                            title: "Jane sat beside you. What would you do?",
                            options: [
                                (
                                    title: "Introduce yourself",
                                    handler: { () in self.goToNextScene(Choice1ViewController())
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
