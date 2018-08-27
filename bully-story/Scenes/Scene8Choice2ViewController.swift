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
                .setBackgroundImage(imageName: "classroom"),
                .playBGM(filename: "WrongChoiceBGM"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad",
                    characterImagePosition: .left,
                    dialogText: "Why........"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad2",
                    characterImagePosition: .left,
                    dialogText: "Why does this happen to me...."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Cry",
                    characterImagePosition: .left,
                    dialogText: "I never did anything to her..."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Cry",
                    characterImagePosition: .left,
                    dialogText: "Maybe it's true what they say... "
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Cry",
                    characterImagePosition: .left,
                    dialogText: "Maybe i'm better off from this cruel world..."
                ),
                ],
//            [.goToNextScene(viewController: ActViewController(title: "", subtitle: "The Ending", time: "", quote: "\"Don't be afraid to speak up!\"", transitionTo: Scene9BadViewController()))],
            
            ]
        )
        
                if empathymeter >= 2 {
                    events = Events(events: [
                        [.goToNextScene(viewController: Scene9BadViewController())],
                        ])
                } else {
        
                    events = Events(events: [
                        [.goToNextScene(viewController: Scene9GoodViewController())],
                        ])
                }
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
