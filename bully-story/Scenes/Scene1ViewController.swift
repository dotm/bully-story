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
                .presentDialog(
                    characterName: "Jean",
                    characterNamePosition: .left,
                    characterImage: "jane_Sad",
                    characterImagePosition: .left,
                    dialogText: "Hi there. I’m Jane. What’s your name?"
                ),
                .setBackgroundImage(imageName: "backgroundImage"),
            ],
            [
                .presentDialog(
                    characterName: "###",
                    characterNamePosition: .right,
                    characterImage: nil,
                    characterImagePosition: .left,
                    dialogText: "Input Name"
                ),
                .setBackgroundImage(imageName: "backgroundImage2"),
            ],
            [.goToNextScene(viewController: Scene2ViewController())],
        ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
