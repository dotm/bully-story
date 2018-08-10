//
//  Events.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 09/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import Foundation

let event_day1: [Event] = [
    [
        .setDialogCharacterName(name: "Jean"),
        .setDialogText(text: "Hello there."),
        .setBackgroundImage(imageName: "backgroundImage"),
    ],
]
let event_day2: [Event] = [
    [
        .setDialogCharacterName(name: "John"),
        .setDialogText(text: "Hello Jean."),
        .setBackgroundImage(imageName: "backgroundImage2"),
    ],
]
let allEvents = event_day1 + event_day2
let events = Events(events: allEvents)

class Events {
    init(events: [Event]) {
        self.events = events
    }
    
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
    private var events: [Event] = []
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
