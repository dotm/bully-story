//
//  Scene6Choice1ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 19/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene6Choice1ViewController: DialogViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .playSFX(filename: "Scene1Bell", delay: 0.0),
                .playBGM(filename: "Scene2BGMusic"),
                .setBackgroundImage(imageName : "classroom"),
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .right,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Good morning everyone. We will start our lesson today. Please open your book now."
                ),
                ],
            [
                .playSFX(filename: "Scene1Bell", delay: 0.0),
                .playBGM(filename: "Scene2BGMusic"),
                .setBackgroundImage(imageName : "classroom"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "Wait.. where's my book.. I'm pretty sure i brought it this morning.."
                ),
                ],
            [
                .playSFX(filename: "Scene1Bell", delay: 0.0),
                .playBGM(filename: "Scene2BGMusic"),
                .setBackgroundImage(imageName : "classroom"),
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .right,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "What's the matter Jane?"
                ),
                ],
           [.goToNextScene(viewController: Scene7ViewController())],
            ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
