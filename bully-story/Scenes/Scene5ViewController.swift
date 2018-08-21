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
                .setBackgroundImage(imageName: "school"),
                .presentNarration(text: "teneg"),
                
                ],
            
            
         [.goToNextScene(viewController: Helper().getPuzzleVC(dialogVC: self))],
           
           
            
            [.goToNextScene(viewController: Scene6ViewController())],
            ])
        let startEvent = events.goToStartEvent()
        
        executeEvent(startEvent)
    }
}
