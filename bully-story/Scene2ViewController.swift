//
//  Scene2ViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 11/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene2ViewController: DialogViewController {
    //MARK: Properties
    override var events: Events {
        get {
            return Events(events: [
                [
                    .setDialogCharacterName(name: "Jean"),
                    .setDialogText(text: "How are you?"),
                    .setBackgroundImage(imageName: "backgroundImage"),
                ],
            ])
        }
    }
    
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
