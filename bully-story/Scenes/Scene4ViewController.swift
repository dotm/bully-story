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
                .setBackgroundImage(imageName : "yard"),
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "Hi Jane! Do you want to go to the mall with us? I heard there’s lots of discount today!"
                ),
                
                ],
            [
                
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .right,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Ah.. that sounds so tempting. But i really should go home now.. Otherwise my mom will get mad. Sorry again Jess."
                ),
                ],
            [
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .left,
                    characterImage: "jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "Again? But yeah okay. Whatever. Your loss"
                ),
                .setBackgroundImage(imageName: "yard"),
                ],
            [
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .right,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Sorry…"
                ),
                .setBackgroundImage(imageName: "yard"),
                ],
            
            
            [
                
                .presentNarration(text: "Before Jane can even finish her words, Jessica already left her. So Jane decided to go home too, with Lucas as she promised earlier before. Unexpectedly, Jessica turned around…"),
                
                ],
            [
                .playSFX(filename: "Scene4SFXWhat", delay: 1.0),
                .playBGM(filename:"Scene4BGMusicAngry"),
                .presentNarration(text: "And she saw Jane going home with Lucas! Lucas has been Jessica’s crush since the first time she saw him. But she could never talk much with him because Lucas has always been so cold towards her. "),
                
                ],
            [
                
                .presentDialog(
                    characterName: "Jessica",
                    characterNamePosition: .right,
                    characterImage: "jane_Smile",
                    characterImagePosition: .right,
                    dialogText: "Lucas? He’s going home with Jane? The new girl? He won’t even reply to my text and now he’s going home with the new girl! I’m gonna make her to pay for this."
                ),
                .setBackgroundImage(imageName: "yard"),
                ],
            
            
            
            [.goToNextScene(viewController: Scene4ViewController())],
            
            
            ])
        
        let startEvent = events.goToStartEvent()
        executeEvent(startEvent)
    }
}
