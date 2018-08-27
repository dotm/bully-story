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
                .playBGM(filename: "WrongChoiceBGM"),
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
            [
                .playSFX(filename: "Scene7SFXSigh", delay: 0.0),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Cry",
                    characterImagePosition: .left,
                    dialogText: "Alright then... I'm sorry madam..."
                ),
                ],
            [
                .playSFX(filename: "Scene7SFXLaugh3", delay: 0.0),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica",
                    characterImagePosition: .right,
                    dialogText: "Hahahaa! Gotcha again!"
                ),
                ],
            
            
            
     [.goToNextScene(viewController: ActViewController(title: "Day 101", subtitle: "", time: "", quote: "\"Your silence are their weapon\"", transitionTo: Scene8ViewController()))],
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



