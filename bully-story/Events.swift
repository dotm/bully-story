//
//  Events.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 09/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import Foundation

let events = Events()

class Events {
    //MARK: Public methods
    func goToStartEvent() -> Event? {
        return goToEvent(index: 0)
    }
    func goToNextEvent() -> Event? {
        return goToEvent(index: eventIndex + 1)
    }
    func goToEvent(index: Int) -> Event? {
        eventIndex = index
        return events[safe: eventIndex]
    }
    
    //MARK: Private properties
    private var eventIndex = 0
    private let events: [Event] = [
        [
            .setDialogCharacterName(name: "Jean"),
            .setDialogText(text: "Hello there."),
            .setBackgroundImage(imageName: "backgroundImage"),
        ],
        [
            .setDialogCharacterName(name: "John"),
            .setDialogText(text: "Hello Jean."),
            .setBackgroundImage(imageName: "backgroundImage2"),
        ],
    ]
}

//MARK: Extra details
extension Collection {
    subscript (safe index: Index) -> Element? {
        let index_outOfBounds = !indices.contains(index)
        if index_outOfBounds {
            return nil
        }else{
            let elementAtIndex = self[index]
            return elementAtIndex
        }
    }
}

enum StoryAction {
    case setDialogCharacterName(name: String)
    case setDialogText(text: String)
    case setBackgroundImage(imageName: String)
}

typealias Event = [StoryAction]
