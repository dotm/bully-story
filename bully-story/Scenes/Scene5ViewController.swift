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
                .presentMonolog(text: "Since that day, I can see that Jessica has been making Jane as her target. She took her seat at canteen when Jane wants to sit down."),
                .setBackgroundImage(imageName: "school"),
                ],
            [
                .presentMonolog(text: "She pushes Jane around when Jane is walking through the corridor."),
                ],
            [
                .presentMonolog(text: "I even heard that she ask other girls to not hang out with Jane."),
                ],
            [
                .presentMonolog(text: "And one day....."),
                ],
            
            
            [.goToNextScene(viewController: ActViewController(title: "Day 4", subtitle: "", time: "Morning", quote: "\"You have a voice\"", transitionTo: Scene6ViewController()))],
//            [.goToNextScene(viewController: Helper().getPuzzleVC(nextDialogVC: Scene5bViewController()))],
        ])
        let startEvent = events.goToStartEvent()
        
        executeEvent(startEvent)
    }
}
