//
//  Scene6Choice2ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 19/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene6Choice2ViewController: DialogViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .playBGM(filename: "WrongChoiceBGM"),
                .setBackgroundImage(imageName : "classroom"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad2",
                    characterImagePosition: .left,
                    dialogText: "I'm just gonna wipe this all by myself.. "
                ),
                ],
            [
                .playSFX(filename: "Scene6SFXLaugh2", delay: 0.0),
                .setBackgroundImage(imageName : "classroom"),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica",
                    characterImagePosition: .right,
                    dialogText: "Hahahaha! Gotcha!"
                ),
                ],
            [.goToNextScene(viewController: ActViewController(title: "Day 4", subtitle: "The Act", time: "Day", quote: "\"Your silence are their weapon\"", transitionTo: Scene7ViewController()))],
            
            ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
