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
                    dialogText: "You just see what am i going to do to you, Jane"
                ),
                .setBackgroundImage(imageName: "canteen"),
                ],
            
            
         [.goToNextScene(viewController: Helper().getPuzzleVC(dialogVC: self))],
         [
            
            .presentDialog(
                characterName: "Jane",
                characterNamePosition: .left,
                characterImage: "Jane_Sad2",
                characterImagePosition: .right,
                dialogText: "........."
            ),
            .setBackgroundImage(imageName: "canteen"),
            ],
           
            
            [.goToNextScene(viewController: Scene6ViewController())],
            ])
        let startEvent = events.goToStartEvent()
        
        executeEvent(startEvent)
    }
}
