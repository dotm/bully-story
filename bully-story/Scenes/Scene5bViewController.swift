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
                    characterImage: "Jane_Sad2",
                    characterImagePosition: .left,
                    dialogText: "........."
                ),
                .setBackgroundImage(imageName: "yard"),
                ],
            [.goToNextScene(viewController: ActViewController(title: "Day 3", subtitle: "The Act", time: "Day", quote: "\"Your silence are their weapon\"", transitionTo: Scene6ViewController()))],
        ])
        let startEvent = events.goToStartEvent()
        
        executeEvent(startEvent)
    }
}

