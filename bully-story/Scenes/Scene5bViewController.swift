//
//  Scene5bViewController.swift
//  bully-story
//
//  Created by Cifran on 23/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene5bViewController: DialogViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad",
                    characterImagePosition: .left,
                    dialogText: "........."
                ),
                .setBackgroundImage(imageName: "room"),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad2",
                    characterImagePosition: .left,
                    dialogText: "I'm really tired of getting treated like this every single day...."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Cry",
                    characterImagePosition: .left,
                    dialogText: "I don't see the point of me living if it's always gonna be like this...."
                ),
                ],
            [.goToNextScene(viewController: ActViewController(title: "Day 100", subtitle: "The Act", time: "Morning", quote: "\"Your silence are their weapon\"", transitionTo: Scene7ViewController()))],
        ])
        let startEvent = events.goToStartEvent()
        
        executeEvent(startEvent)
    }
}

