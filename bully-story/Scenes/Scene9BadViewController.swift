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
                .setBackgroundImage(imageName: "black"),
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "Teacher",
                    characterImagePosition: .left,
                    dialogText: "Good morning everyone. I have a bad news today.."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "teacher_Persevere",
                    characterImagePosition: .left,
                    dialogText: "Unfortunately, our friend Jane, has passed away yesterday. She took her own life..."
                ),
            ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Fearful",
                    characterImagePosition: .right,
                    dialogText: "..."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Lucas",
                    characterNamePosition: .right,
                    characterImage: "Lucas_Sweat",
                    characterImagePosition: .right,
                    dialogText: "..."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "teacher_Persevere",
                    characterImagePosition: .left,
                    dialogText: "She took her own life because she couldn't stand of being bullied by Jessica anymore."
                ),
            ],
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "teacher_Persevere",
                    characterImagePosition: .left,
                    dialogText: "We know that from the suicide note her family found. "
                ),
                ],
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "Teacher",
                    characterImagePosition: .left,
                    dialogText: "Jessica, you are expected in the headmaster office now."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Fearful",
                    characterImagePosition: .right,
                    dialogText: "But... but... I didn't mean to."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Teacher",
                    characterNamePosition: .left,
                    characterImage: "Teacher_Angry",
                    characterImagePosition: .left,
                    dialogText: "Office! Now!"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Sob",
                    characterImagePosition: .right,
                    dialogText: "......"
                ),
                ],
            [
                .presentMonolog(text: "Jessica then being dealt to the Headmaster and got kicked out from the school."),
                ],
            [
                .presentMonolog(text: "Ever since then, Jessica is never shown to bully the others. She really regrets it that her actions cause someone else to took their own life."),
                ],
            [
                .presentMonolog(text: "But still, no matter how big her regrets are, Jane is never coming back."),
                ],
            [
                .presentMonolog(text: "And she's been living with her regrets ever since...."),
                ],
            [
            .presentNarration(text: "You failed to save Jane from her misery of living under Jessica’s bully. Which results in Jane taking her own life…") ],
            [
            .presentNarration(text: "You should have took the small actions when you see someone like Jane is being bullied! Take action when you see bullying happens next time! You could be saving someone else’s life!") ],
            ]
        )
        
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
