//
//  Global.swift
//  bully-story
//
//  Created by Cifran on 18/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

var username: String = "Vanessa"
var empathymeter: Int = 0

func saveGlobalData(){
    UserDefaults.standard.set(username, forKey: "username")
    UserDefaults.standard.set(empathymeter, forKey: "empathymeter")
    
    let events = Events(events: [
        [
            .setBackgroundImage(imageName: "classroom"),
            .presentDialog(
                characterName: "Jane",
                characterNamePosition: .left,
                characterImage: "Jane_Smile",
                characterImagePosition: .left,
                dialogText: "Hi there. I’m Jane. What’s your name?"
            ),
            ],[
                .setBackgroundImage(imageName: "classroom"),
                .presentDialog(
                    characterName: "Jane",
                    characterNamePosition: .left,
                    characterImage: "Jane_Smile",
                    characterImagePosition: .left,
                    dialogText: "Hi there. I’m Jane. What’s your name?"
                ),
                ],
              ])
//    let encoded = NSKeyedArchiver.archivedData(withRootObject: events)
//
//    UserDefaults.standard.set(encoded, forKey: "test")

}
func loadGlobalData(){
    username = UserDefaults.standard.string(forKey: "username")!
    empathymeter = UserDefaults.standard.integer(forKey: "empathymeter")
    
//    let decoded = UserDefaults.standard.object(forKey: "test") as! Data
//    let obj = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! Events
//    print(obj.events)
}
