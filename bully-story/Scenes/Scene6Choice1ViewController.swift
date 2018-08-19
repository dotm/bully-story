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
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Thankyou, thankyou so much for helping me"
                ),
                ],
            
           [.goToNextScene(viewController: Scene7ViewController())],
            ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
