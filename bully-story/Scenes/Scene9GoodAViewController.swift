//
//  Scene9GoodAViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 23/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene9GoodAViewController: DialogViewController {
   
        //MARK: Lifecycle hooks
        override func viewDidLoad() {
            super.viewDidLoad()
            
            events = Events(events: [
                
                [
                    .setBackgroundImage(imageName: "wc"),
                    .presentDialog(
                        characterName: "Jane",
                        characterNamePosition: .left,
                        characterImage: "Jane_Smile2",
                        characterImagePosition: .left,
                        dialogText: "It's true. I'm really glad you stood up for me that day."
                    ),
                    ],
                [
                    .presentDialog(
                        characterName: "Jane",
                        characterNamePosition: .left,
                        characterImage: "Jane_Smile3",
                        characterImagePosition: .left,
                        dialogText: "So once again, thankyou"
                    ),
                    ],
                [
                    .presentNarration(text: "Ever since then Jane looks much happier than she did before. Jessica is also never shown to bully other people anymore."),
                    ],
                ]
            )
            
            
            let startEvent = events.goToStartEvent()
            executeEvent(startEvent)
        }
}
