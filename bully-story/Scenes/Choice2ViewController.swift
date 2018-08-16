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
                .presentDialog(
                    characterName: "John",
                    characterNamePosition: .right,
                    characterImage: nil,
                    characterImagePosition: .left,
                    dialogText: "Fine"
                ),
                .setBackgroundImage(imageName: "backgroundImage2"),
            ],
            [
                .presentNarration(text: "From the other side of the class, Jessica is staring at Jane cynically. She realise Jane is very pretty and might be a threat for her popularity. She’s thinking to befriend Jane so that maybe she can be even more popular."),
                
                ],
            [
                .presentNarration(text: "The lesson started, they all studied quietly. At the end of the class the teacher gave them homework for them to do."),
                
                ],
            
            
            [.goToNextScene(viewController: Scene2ViewController())],
        ])
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
