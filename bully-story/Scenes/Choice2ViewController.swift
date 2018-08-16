//
//  Choice2ViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 11/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Choice2ViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .presentDialog(
                    characterName: "John",
                    characterNamePosition: .right,
                    characterImage: nil,
                    characterImagePosition: .left,
                    dialogText: "Fine"
                ),
                .setBackgroundImage(imageName: "backgroundImage2"),
            ],
            [.goToNextScene(viewController: Scene2ViewController())],
        ])
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
