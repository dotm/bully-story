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
        
        events = Events(events: [
            [
                .presentChoices(choices: (
                    title: "Jane sat beside you. What would you do?",
                    options: [
                        (
                            title: "Introduce yourself",
                            handler: { () in self.goToNextScene(Choice1ViewController()) }
                        ),
                        (
                            title: "Ignore Her",
                            handler: { () in self.goToNextScene(Choice2ViewController()) }
                        ),
                        ]
                ))
            ],
            
            [.goToNextScene(viewController: Scene2ViewController())],
        ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
