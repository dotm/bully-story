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
                    .setBackgroundImage(imageName: "halaman"),
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
                        dialogText: "So once again, thankyou."
                    ),
                    ],
                [
                    .presentNarration(text: "Ever since then Jane looks much happier than she did before."),
                    ],
                [
                    .presentNarration(text: "Jessica is also never shown to bully other people anymore. Maybe after all, she realizes that she's been doing the wrong thing."),
                    ],
                [
                .presentNarration(text: "It's true what they say, being a bystander of bullying we can step up, speak up and help stop bullying."),
                    ],
                [
                    .presentNarration(text: "It can be really scary to step up and help the person being bullied."),
                    ],
                [
                    .presentNarration(text: "But bystanders can be either part of the bullying problem by ignoring it or be an important part of the solution"),
                    ],
                [
                    .presentNarration(text: "So rather than adding more problems about bullying, we better be the HERO to step up and help stop bullying!"),
                    ],
                [
                    .goToNextScene(viewController: CertificateViewController())
                ],
                
                ]
            )
            
            
            let startEvent = events.goToStartEvent()
            executeEvent(startEvent)
        }
}
