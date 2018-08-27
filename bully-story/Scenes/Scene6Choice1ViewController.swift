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
                .playBGM(filename: "RightChoiceBGM"),
                .setBackgroundImage(imageName : "classroom"),
                .presentNarration(text: "Great Choice! You chose to help her to clean off her table! Keep doing small action like this and you can stop Jessica from bullying Jane!"),
                ],
//            [
//                
//                .playBGM(filename: "RightChoiceBGM"),
//                .setBackgroundImage(imageName : "classroom"),
//                .presentMonolog(text: "I couldn't stand anymore seeing Jane is being treated like that by Jessica, so i decided to help her to clean off her table."),
//                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Thank you, thank you so much for helping me, #name."
                ),
                ],
            [
                .playBGM(filename:"Scene4BGMusicAngry"),
                
                .setBackgroundImage(imageName : "halaman"),
                .presentMonolog(text: "But after i helped her that day, Jessica blocked me when I was walking home."),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Angry",
                    characterImagePosition: .right,
                    dialogText: "Hey #name! Why are you helping Jane? You just let her be, you understand me?"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Angry",
                    characterImagePosition: .right,
                    dialogText: "If you help her again, you will be my next target!"
                ),
                ],
            [
                .presentMonolog(text: "I was scared because Jessica has her power and she can really make me as her next target."),
                ],
            [
                .presentMonolog(text: "So i decided to back down... And Jessica's bully towards Jane is getting worse."),
                
                ],
            
//           [.goToNextScene(viewController: ActViewController(title: "Day 4", subtitle: "The Act", time: "Day", quote: "\"Your silence are their weapon\"", transitionTo: Scene7ViewController()))],
           [.goToNextScene(viewController: Helper().getPuzzleVC(nextDialogVC: Scene5bViewController()))]
            ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
