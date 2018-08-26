//
//  Scene3ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 17/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene3ViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [.setBackgroundImage(imageName: "classroom"),
            
                .playBGM(filename: "Scene1BGMusic"),
                .playSFX(filename: "Scene1Bell", delay: 3.0),
                
                .presentNarration(text: "The next morning, Lucas, one of Jane’s classmate come by to Jane’s seat and is talking to Jane. They both look so in tune. They talked and they talked.."),
                ],
            [
            .playBGM(filename: "Scene3BGMusic"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Haha, you’re very funny, Lucas"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Lucas",
                    characterNamePosition: .right,
                    characterImage: "Lucas_Smile",
                    characterImagePosition: .right,
                    dialogText: "Thankyou! Such compliment coming from you. Oh by the way, where do you live?"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile2",
                    characterImagePosition: .left,
                    dialogText: "Oh i live at Orchad Street."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Lucas",
                    characterNamePosition: .right,
                    characterImage: "Lucas_Smile",
                    characterImagePosition: .right,
                    dialogText: "Oh really? Such coincidence! I pass there every time i go home. Do you want to go together later?"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Go? Go where?"
                ),
                ],
            [
                
                .presentDialog(
                    characterName: "Lucas",
                    characterNamePosition: .right,
                    characterImage: "Lucas_XP",
                    characterImagePosition: .right,
                    dialogText: "Go home, of course you silly."
                ),
                ],
            [
              .playSFX(filename: "Scene3SFX", delay: 0.0),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile2",
                    characterImagePosition: .left,
                    dialogText: "Yes sure. I wanted to go home earlier anyway today."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Lucas",
                    characterNamePosition: .right,
                    characterImage: "Lucas_Smile",
                    characterImagePosition: .right,
                    dialogText: "I see, okay then. The class almost start now, i’ll see you later today!"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Angry",
                    characterImagePosition: .right,
                    dialogText: "Lucas is talking to her now?! Hmmph!"
                ),
                ],
            [.goToNextScene(viewController: ActViewController(title: "Day 2", subtitle: "The Beginning", time: "Afternoon", quote: "\"You have a voice\"", transitionTo: Scene4ViewController()))],
            ])
        let startEvent = events.goToStartEvent()
        
        executeEvent(startEvent)
    }
}
