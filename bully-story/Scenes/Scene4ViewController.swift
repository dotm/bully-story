//
//  Scene4ViewController.swift
//  bully-story
//
//  Created by Vanessa Wijaya on 17/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Scene4ViewController: DialogViewController {
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Events(events: [
            [
                .playSFX(filename: "Scene1Bell", delay: 0.0),
                .playBGM(filename: "Scene2BGMusic"),
                .setBackgroundImage(imageName : "school"),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Smug",
                    characterImagePosition: .right,
                    dialogText: "Hi Jane! Do you want to go to the mall with us? I heard there’s lots of discount today!"
                ),
                
                ],
            [
                
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad3",
                    characterImagePosition: .left,
                    dialogText: "Ah.. that sounds so tempting. But i really should go home now.."
                ),
                ],
            [
                
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad2",
                    characterImagePosition: .left,
                    dialogText: "Otherwise my mom will get mad. Sorry again Jess."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Unamused",
                    characterImagePosition: .right,
                    dialogText: "Again? But yeah okay. Whatever. Your loss."
                ),
                .setBackgroundImage(imageName: "school"),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Sad2",
                    characterImagePosition: .left,
                    dialogText: "Sorry…"
                ),
                .setBackgroundImage(imageName: "school"),
                ],
            
            [
                .presentNarration(text: "Before Jane can even finish her words, Jessica already left her. So Jane decided to go home too. Unexpectedly, Jessica turned around…"),
                ],
            [
                .playSFX(filename: "Scene4SFXWhat", delay: 1.0),
                .playBGM(filename:"Scene4BGMusicAngry"),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Angry",
                    characterImagePosition: .right,
                    dialogText: "Lucas? He’s going home with Jane? The new girl?"
                ),
                .setBackgroundImage(imageName: "school"),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Angry",
                    characterImagePosition: .right,
                    dialogText: "He won’t even reply to my text and now he’s going home with the new girl!"
                ),
                .setBackgroundImage(imageName: "school"),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Angry",
                    characterImagePosition: .right,
                    dialogText: "I’m gonna make her to pay for this."
                ),
                .setBackgroundImage(imageName: "school"),
                ],
            
    [.goToNextScene(viewController: ActViewController(title: "Day 3", subtitle: "The Target", time: "", quote: "\"You have a voice\"", transitionTo: Scene5ViewController()))],
            ])
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
