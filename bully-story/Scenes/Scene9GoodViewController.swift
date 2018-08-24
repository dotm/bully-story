//
//  Scene9ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 23/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene9GoodViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
     
        events = Events(events: [
            [
                .playBGM(filename: "Scene9BGM"),
                .setBackgroundImage(imageName: "halaman"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Thankyou #name! School has been really fun since i started hanging out with you!"
                ),
                ],
            [
                .presentDialog(
                    characterName: "#name",
                    characterNamePosition: .left,
                    characterImage: "",
                    characterImagePosition: .left,
                    dialogText: "My pleasure Jane! What matters is Jessica never come close to bother you anymore."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile2",
                    characterImagePosition: .left,
                    dialogText: "Yes, she hasn't come near me every since you called her out that day"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile2",
                    characterImagePosition: .left,
                    dialogText: "If you didn't do that, i don't think i would be standing here today."
                ),
                ],
            
            [
                .presentChoices(choices: (
                    title: "",
                    options: [
                        (
                            title: "Shhhh.. Don't say things like that",
                            handler: { () in
                                
                                self.goToNextScene(Scene9GoodAViewController())
                        }
                        ),
                        (
                            title: "Of course, my pleasure Jane.",
                            
                            handler: { () in
                                self.goToNextScene(Scene9GoodAViewController()) }
                        ),
                        ]
                )),
                ],
                      
                      ])
        let startEvent = events.goToStartEvent()
        
        executeEvent(startEvent)
    }
}
