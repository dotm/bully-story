//
//  Choice1ViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 11/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Choice1ViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .setBackgroundImage(imageName: "classroom"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Sad",
                    characterImagePosition: .left,
                    dialogText: "Hi there. I’m Jane. What’s your name?"
                ),
            ],[
                .goToNextScene(viewController: Helper().getInputNameVC(dialogVC: self))
            ],[
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "Hello, #name. This school looks really nice. Looking forward to more days here!"
                ),
            ],[
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "That girl is kind of pretty.."
                ),
            ],[
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .right,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Hello everyone. Let's start our lesson today! "
                ),
            ],[
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .right,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Open your book at page 10 and do the little quiz there."
                ),
            ],[
                .stopBGM(),
                .goToNextScene(viewController: Helper().getHangmanVC(dialogVC: self))
            ],[
                .playBGM(filename: "Scene1BGMusic"),
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "Okay class dismissed! See you tomorrow everyone!"
                ),
            ],[
                .goToNextScene(viewController: Scene2ViewController())
            ],
      ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}


