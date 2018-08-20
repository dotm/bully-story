//
//  Choice2ViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 11/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene1BViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            
            [
                 .setBackgroundImage(imageName: "classroom"),
                 .presentNarration(text: "You chose to ignore Jane. \n She's then preparing her things to study and you're preparing yours too."),
                
                ],
            [
                .presentNarration(text: "From the other side of the class, Jessica is staring at Jane cynically. She realises Jane is very pretty and might be a threat for her popularity."),
                
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
