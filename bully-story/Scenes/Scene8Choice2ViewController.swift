//
//  Scene7Choice1ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 21/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene8Choice2ViewController: DialogViewController {
    
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            
            [
                .setBackgroundImage(imageName: "wc"),
                .presentNarration(text: "You chose to ignore Jane."),
                .playBGM(filename: "WrongChoiceBGM")
                
            ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Sad2",
                    characterImagePosition: .left,
                    dialogText: "Why........"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Cry",
                    characterImagePosition: .left,
                    dialogText: "Why does this happen to me...."
                ),
                ],
            
        )
        
        //        if empathymeter > 80 {
        //            events = Events(events: [
        //                ])
        //        } else {
        //
        //            events = Events(events: [
        //                ])
        //        }
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
