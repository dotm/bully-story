//
//  Scene1ViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 09/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene1ViewController: DialogViewController {
    //MARK: Properties
    override var events: Events {
        get {
            return Events(events: [
                [
                    .setDialogCharacterName(name: "Jean"),
                    .setDialogText(text: "Hi there."),
                    .setBackgroundImage(imageName: "backgroundImage"),
                ],
                [
                    .setDialogCharacterName(name: "John"),
                    .setDialogText(text: "Hello Jean."),
                    .setBackgroundImage(imageName: "backgroundImage2"),
                ],
                [.goToNextScene(segueIdentifier: "goToScene2")],
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
