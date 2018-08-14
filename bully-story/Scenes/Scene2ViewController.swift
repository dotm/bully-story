//
//  Scene2ViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 11/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene2ViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .presentDialog(characterName: "Jean", dialogText: "How are you?"),
                .setBackgroundImage(imageName: "backgroundImage"),
            ],
            [
                .presentChoices(choices: (
                    title: "How are you?",
                    options: [
                        (
                            title: "I'm fine. Thanks.",
                            handler: { () in self.goToNextScene(Choice1ViewController()) }
                        ),
                        (
                            title: "Fine",
                            handler: { () in self.goToNextScene(Choice2ViewController()) }
                        ),
                    ]
                ))
            ]
        ])

        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
