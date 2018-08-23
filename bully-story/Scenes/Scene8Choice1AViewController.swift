//
//  Scene7Choice1ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 21/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene8Choice1AViewController: DialogViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .playBGM(filename: "Scene8RightChoice"),
                .setBackgroundImage(imageName : "wc"),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica",
                    characterImagePosition: .right,
                    dialogText: "It's none of your problem!"
                ),
                ],
            [
                .presentDialog(
                    characterName: "#name",
                    characterNamePosition: .left,
                    characterImage: "",
                    characterImagePosition: .left,
                    dialogText: "Of course it is! What you're doing is not cool at all!"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica",
                    characterImagePosition: .right,
                    dialogText: "So? I don't care!"
                ),
            ],
            [
                .presentDialog(
                    characterName: "#name",
                    characterNamePosition: .left,
                    characterImage: "",
                    characterImagePosition: .left,
                    dialogText: "She has never done anything bad to you! Have you ever imagine what it's like to be in her position?"
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica",
                    characterImagePosition: .right,
                    dialogText: "Whatever! I'm leaving bye!"
                ),
                .playSFX(filename: "Scene8SFXDoorCloses", delay: 1.0),
                ],
            [
                .presentDialog(
                    characterName: "#name",
                    characterNamePosition: .right,
                    characterImage: "",
                    characterImagePosition: .right,
                    dialogText: "Wait Jane, let me help you."
                ),
                ],
            [
                .playSFX(filename: "Scene8SFXDoorOpens", delay: 0.0),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Thankyou. Thankyou so much. You've been helping me a lot."
                ),
            ],
            [
                .presentDialog(
                    characterName: "#name",
                    characterNamePosition: .right,
                    characterImage: "",
                    characterImagePosition: .right,
                    dialogText: "Yes of course. You don't deserve to be treated this way."
                ),
                ],
            [
                .presentDialog(
                    characterName: "#name",
                    characterNamePosition: .right,
                    characterImage: "",
                    characterImagePosition: .right,
                    dialogText: "Say this, why don't you join us after school everyday? That way maybe Jessica wouldn't bother you as much again."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Oh really? Of course I'd like to! Yes.. maybe that way she won't do it anymore.."
                ),
                ],
            [
                .presentDialog(
                    characterName: "#name",
                    characterNamePosition: .right,
                    characterImage: "",
                    characterImagePosition: .right,
                    dialogText: "Yes, you've got friends that have your back now. Don't you worry anymore Jane. I'll be sure to stand up when she's doing things to you again. "
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile3",
                    characterImagePosition: .left,
                    dialogText: "Thankyou. Thankyou so much #name"
                ),
                ],
            
            [.goToNextScene(viewController: Scene9GoodViewController())],
            ])
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
