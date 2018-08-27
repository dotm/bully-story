//
//  Scene7Choice1ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 19/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene7Choice1ViewController: DialogViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            //interaksi cari barang
            [
                
                .playBGM(filename: "RightChoiceBGM"),
                .setBackgroundImage(imageName : "classroom"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Found it!!"
                ),
                ],
            [
                
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .right,
                    characterImage: "Teacher",
                    characterImagePosition: .right,
                    dialogText: "Very well Jane. Let's continue our class now."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Thank you for helping me. Thank you so much #name!"
                ),
                ],
            
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Angry",
                    characterImagePosition: .right,
                    dialogText: "Arrrgghh!"
                ),
                ],
            
            [.goToNextScene(viewController: ActViewController(title: "Day 101", subtitle: "", time: "", quote: "\"Courage is fire, and bullying is smoke.\"", transitionTo: Scene8ViewController()))],
            ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
