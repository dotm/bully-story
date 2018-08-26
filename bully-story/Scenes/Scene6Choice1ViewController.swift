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
            [.goToNextScene(viewController: Helper().getEraseGameVC(dialogVC: self))],
            [
                
                .playBGM(filename: "RightChoiceBGM"),
                .setBackgroundImage(imageName : "classroom"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Thank you, thank you so much for helping me"
                ),
                ],
            
           [.goToNextScene(viewController: ActViewController(title: "Day 4", subtitle: "The Act", time: "Day", quote: "\"Your silence are their weapon\"", transitionTo: Scene7ViewController()))],
            ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
