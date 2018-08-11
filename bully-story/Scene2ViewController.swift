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
                .setDialogCharacterName(name: "Jean"),
                .setDialogText(text: "How are you?"),
                .setBackgroundImage(imageName: "backgroundImage"),
            ],
            [
                .presentChoices(choices: (
                    title: "Choices",
                    message: "What will you choose?",
                    options: [
                        (
                            title: "Option 1",
                            handler: { _ in self.goToNextScene("choice1") }
                        ),
                        (
                            title: "Option 2",
                            handler: { _ in self.goToNextScene("choice2") }
                        ),
                    ]
                ))
            ]
        ])

        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
