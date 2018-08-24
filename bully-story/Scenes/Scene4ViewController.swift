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
                    characterNamePosition: .left,
                    characterImage: "Jessica_Smug",
                    characterImagePosition: .left,
                    dialogText: "Hi Jane! Do you want to go to the mall with us? I heard there’s lots of discount today!"
                ),
                
                ],
            [
                
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .right,
                    characterImage: "Jane_Sad3",
                    characterImagePosition: .right,
                    dialogText: "Ah.. that sounds so tempting. But i really should go home now.."
                ),
                ],
            [
                
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .right,
                    characterImage: "Jane_Sad2",
                    characterImagePosition: .right,
                    dialogText: "Otherwise my mom will get mad. Sorry again Jess."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "Jessica_Unamused",
                    characterImagePosition: .left,
                    dialogText: "Again? But yeah okay. Whatever. Your loss"
                ),
                .setBackgroundImage(imageName: "school"),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .right,
                    characterImage: "Jane_Sad2",
                    characterImagePosition: .right,
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
                .playSFX(filename: "Scene4SFXWhat", delay: 1.0),
                .playBGM(filename:"Scene4BGMusicAngry"),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "Jessica_Angry",
                    characterImagePosition: .right,
                    dialogText: "He won’t even reply to my text and now he’s going home with the new girl!"
                ),
                .setBackgroundImage(imageName: "school"),
                ],
           
            
            
            
    [.goToNextScene(viewController: Scene5ViewController())],
            
            
            ])
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
