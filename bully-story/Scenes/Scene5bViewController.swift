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
                    characterImagePosition: .right,
                    dialogText: "........."
                ),
                .setBackgroundImage(imageName: "canteen"),
                ],
            [.goToNextScene(viewController: Scene6ViewController())],
        ])
        let startEvent = events.goToStartEvent()
        
        executeEvent(startEvent)
    }
}

