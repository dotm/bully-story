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
                 .setBackgroundImage(imageName: "classroom"),
                 .presentNarration(text: "You chose to ignore Jane. \n She's then preparing her things to study and you're preparing yours too."),
                
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "That girl is kind of pretty.."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "Hello everyone. Let's start our lesson today! Open your book at page 10 and do the little quiz there."
                ),
                ],
            [.goToNextScene(viewController: Helper().getHangmanVC(dialogVC: self))],
            
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "Okay class dismissed! See you tomorrow everyone!"
                ),
                ],
            [.goToNextScene(viewController: Scene2ViewController())],
            ]
        )
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}


