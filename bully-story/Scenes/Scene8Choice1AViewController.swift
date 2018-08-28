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
        
        print("aowowowowoowowowoowow \(empathymeter)")
        
        if empathymeter < 3 {
            events = Events(events: [
                [
                    .setBackgroundImage(imageName : "classroom"),
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
                        characterImage: "Jessica_Angry",
                        characterImagePosition: .right,
                        dialogText: "So? I don't care! Haven't i told you that if you stand in my way again, I will make you as my next target?!"
                    ),
                    ],
                [
                    .presentDialog(
                        characterName: "#name",
                        characterNamePosition: .left,
                        characterImage: "",
                        characterImagePosition: .left,
                        dialogText: "I'm not scared of you Jessica! I've got my other friends to stand up about what have you been doing to Jane."
                    ),
                    ],
                [
                    .presentDialog(
                        characterName: "#name",
                        characterNamePosition: .left,
                        characterImage: "",
                        characterImagePosition: .left,
                        dialogText: "I can even tell it to the teachers and you know you will get your punishment because of that!"
                    ),
                    ],
                [
                    .presentDialog(
                        characterName: "#name",
                        characterNamePosition: .left,
                        characterImage: "",
                        characterImagePosition: .left,
                        dialogText: "Jane has never done anything bad to you! So why are you doing this to her? "
                    ),
                    ],
                [
                    .presentDialog(
                        characterName: "#name",
                        characterNamePosition: .left,
                        characterImage: "",
                        characterImagePosition: .left,
                        dialogText: "Have you ever imagine what it's like to be in her position?"
                    ),
                    ],
                [
                    .presentDialog(
                        characterName: "Jessica",
                        characterNamePosition: .right,
                        characterImage: "Jessica",
                        characterImagePosition: .right,
                        dialogText: "Arrrghhhh! You are so annoying! Don't even bother telling it to the teacher!"
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
                    .playBGM(filename: "RightChoiceBGM"),
                    .presentDialog(
                        characterName: "#name",
                        characterNamePosition: .right,
                        characterImage: "",
                        characterImagePosition: .right,
                        dialogText: "Wait Jane, let me help you out of there."
                    ),
                    ],
                [
                    .playSFX(filename: "Scene8SFXDoorOpens", delay: 0.0),
                    .presentDialog(
                        characterName: "Jane",
                        characterNamePosition: .left,
                        characterImage: "Jane_Smile3",
                        characterImagePosition: .left,
                        dialogText: "Thankyou. Thankyou so much #name. You've been helping me a lot."
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
                        characterImage: "Jane_Smile3",
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
                        characterImage: "Jane_Smile3",
                        characterImagePosition: .left,
                        dialogText: "Thankyou. Thankyou so much #name"
                    ),
                    ],
                
                [.goToNextScene(viewController: Scene9BadViewController())],
                
                ])
        } else {
            
            events = Events(events: [
                [
                    .setBackgroundImage(imageName : "classroom"),
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
                        characterImage: "Jessica_Angry",
                        characterImagePosition: .right,
                        dialogText: "So? I don't care! Haven't i told you that if you stand in my way again, I will make you as my next target?!"
                    ),
                    ],
                [
                    .presentDialog(
                        characterName: "#name",
                        characterNamePosition: .left,
                        characterImage: "",
                        characterImagePosition: .left,
                        dialogText: "I'm not scared of you Jessica! I've got my other friends to stand up about what have you been doing to Jane."
                    ),
                    ],
                [
                    .presentDialog(
                        characterName: "#name",
                        characterNamePosition: .left,
                        characterImage: "",
                        characterImagePosition: .left,
                        dialogText: "I can even tell it to the teachers and you know you will get your punishment because of that!"
                    ),
                    ],
                [
                    .presentDialog(
                        characterName: "#name",
                        characterNamePosition: .left,
                        characterImage: "",
                        characterImagePosition: .left,
                        dialogText: "Jane has never done anything bad to you! So why are you doing this to her? Have you ever imagine what it's like to be in her position?"
                    ),
                    ],
                [
                    .presentDialog(
                        characterName: "#name",
                        characterNamePosition: .left,
                        characterImage: "",
                        characterImagePosition: .left,
                        dialogText: "Have you ever imagine what it's like to be in her position?"
                    ),
                    ],
                [
                    .presentDialog(
                        characterName: "Jessica",
                        characterNamePosition: .right,
                        characterImage: "Jessica",
                        characterImagePosition: .right,
                        dialogText: "Arrrghhhh! You are so annoying! Don't even bother telling it to the teacher!"
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
                    .playBGM(filename: "RightChoiceBGM"),
                    .presentDialog(
                        characterName: "#name",
                        characterNamePosition: .right,
                        characterImage: "",
                        characterImagePosition: .right,
                        dialogText: "Wait Jane, let me help you out of there."
                    ),
                    ],
                [
                    .playSFX(filename: "Scene8SFXDoorOpens", delay: 0.0),
                    .presentDialog(
                        characterName: "Jane",
                        characterNamePosition: .left,
                        characterImage: "Jane_Smile3",
                        characterImagePosition: .left,
                        dialogText: "Thankyou. Thankyou so much #name. You've been helping me a lot."
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
                        characterImage: "Jane_Smile3",
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
                        characterImage: "Jane_Smile3",
                        characterImagePosition: .left,
                        dialogText: "Thankyou. Thankyou so much #name"
                    ),
                    ],
                
                [.goToNextScene(viewController: Scene9GoodViewController())],
                
                ])
        }
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
