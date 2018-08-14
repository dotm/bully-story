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
    /// <#Description#>
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .presentDialog(characterName: "Jean", dialogText: "Hi there."),
                .setBackgroundImage(imageName: "backgroundImage"),
            ],
            [
                .presentDialog(characterName: "John", dialogText: "Hello Jean."),
                .setBackgroundImage(imageName: "backgroundImage2"),
            ],
            [.goToNextScene(viewController: Scene2ViewController())],
            ]
        )
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
