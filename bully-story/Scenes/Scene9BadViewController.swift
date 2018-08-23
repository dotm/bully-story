//
//  Scene9BadViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 23/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene9BadViewController: DialogViewController {

    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            
            [
                .setBackgroundImage(imageName: "class"),
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile2",
                    characterImagePosition: .left,
                    dialogText: "Good morning everyone. I have a bad news today.."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Unfortunately, our friend Jane, has passed away yesterday. She took her own life..."
                ),
            ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .right,
                    dialogText: "..."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Lucas",
                    characterNamePosition: .right,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .right,
                    dialogText: "..."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "She took her own life because she couldn't stand of being bullied by Jessica anymore. We know that from the suicide note her family found. "
                ),
            ],
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "She took her own life because she couldn't stand of being bullied by Jessica anymore. We know that from the suicide note her family found. "
                ),
                ],
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Jessica, you are expected in the headmaster office now."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jane_Smile3",
                    characterImagePosition: .right,
                    dialogText: "..."
                ),
                ],
            [
                .presentNarration(text: "Ever since then, Jessica is never shown to bully the others. Her regrets of being the reason that Jane commited suicide has been haunting her ever since."),
                ],
            ]
        )
        
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
