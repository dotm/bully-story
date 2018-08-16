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
                    dialogText: "Hi There"
                ),
                .setBackgroundImage(imageName: "classroom"),
                .playBGM(filename: "sampleMusic"),
                .playSFX(filename: "sampleSFX", delay: 3.0)
            ],
            [
                .presentDialog(
                    characterName: "John",
                    characterNamePosition: .right,
                    characterImage: nil,
                    characterImagePosition: .left,
                    dialogText: "Hello Jean"
                ),
                .setBackgroundImage(imageName: "classroom"),
                .playBGM(filename: "sampleMusic"),
            ],
            [.goToNextScene(viewController: Scene2ViewController())],
        ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
