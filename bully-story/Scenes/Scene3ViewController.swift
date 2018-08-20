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
                    characterImage: "jane_Smile",
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
                    characterImage: "jane_Smile2",
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
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "Go? Go where?"
                ),
                ],
            [
                
                .presentDialog(
                    characterName: "Lucas",
                    characterNamePosition: .right,
                    characterImage: "Lucas_melet",
                    characterImagePosition: .right,
                    dialogText: "Go home, of course you silly."
                ),
                ],
            [
              .playSFX(filename: "Scene3SFX", delay: 0.0),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
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
                .playBGM(filename: "Scene2Narration(intense)"),
                .presentNarration(text: "Lucas returned back to his seat. Jessica saw it when Lucas and Jane were having fun and laughing while chatting. "),

                ],
            [
                .playBGM(filename: "Scene2Narration(intense)"),
               .presentNarration(text: "Her jealousy starting to increase more. But she chose to ignore that and continue to pay attention to the class."),
                ],
            
             [.goToNextScene(viewController: Scene4ViewController())],
            ])
        let startEvent = events.goToStartEvent()
        
        executeEvent(startEvent)
    }
}
