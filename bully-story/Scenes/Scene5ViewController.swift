//
//  Scene5ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 20/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene5ViewController: DialogViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Angry",
                    characterImagePosition: .right,
                    dialogText: "I’m gonna make her to pay for this."
                ),
                .setBackgroundImage(imageName: "school"),
                ],
            [.goToNextScene(viewController: Helper().getPuzzleVC(nextDialogVC: Scene5bViewController()))],
        ])
        let startEvent = events.goToStartEvent()
        
        executeEvent(startEvent)
    }
}
