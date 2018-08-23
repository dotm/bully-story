//
//  Scene7Choice2ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 19/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene7Choice2ViewController: DialogViewController {

    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            
            [
                .setBackgroundImage(imageName: "classroom"),
                .presentNarration(text: "You chose to ignore Jane."),
                .playBGM(filename: "WrongChoiceBGM")
                
                ],
            [
               
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad2",
                    characterImagePosition: .left,
                    dialogText: "...... I can't find it....."
                ),
                
                ],
            [
            .playSFX(filename: "Scene7SFXGetOut", delay : 1.0),
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .right,
                    characterImage: "Teacher_Angry",
                    characterImagePosition: .right,
                    dialogText: "Well you know the consenquences for not bringing book for my class right? OUT!"
                ),
                ],
            [
                .playSFX(filename: "Scene7SFXSigh", delay: 0.0),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad3",
                    characterImagePosition: .left,
                    dialogText: ".........."
                ),
                
                ],
     [.goToNextScene(viewController: Scene8ViewController())],
            ]
        )
        
//        if empathymeter > 80 {
//            events = Events(events: [
//                ])
//        } else {
//            
//            events = Events(events: [
//                ])
//        }
            
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}



