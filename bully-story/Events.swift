//
//  Events.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 09/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

let event_day1 = Events(events: [
    [
        .setDialogCharacterName(name: "Jean"),
        .setDialogText(text: "Hello there."),
        .setBackgroundImage(imageName: "backgroundImage"),
    ],
])

let event_day2_beforeChoice = Events(events: [
    [
        .setDialogCharacterName(name: "John"),
        .setDialogText(text: "Hello Jean."),
        .setBackgroundImage(imageName: "backgroundImage2"),
    ],
    [
        .presentChoices(choices: (
            title: "Choices",
            message: "What will you choose?",
            options: [
                (
                    title: "Option 1",
                    handler: { _ in event_day2_choosenOption = 1 }
                ),
                (
                    title: "Option 2",
                    handler: { _ in event_day2_choosenOption = 2 }
                ),
          ]
        ))
    ]
])
let event_day2_afterChoosing_option1 = Events(events: [
    [.setDialogText(text: "I choose the first option")]
])
let event_day2_afterChoosing_option2 = Events(events: [
    [.setDialogText(text: "I choose the second option")]
])
var event_day2_choosenOption = 1
let event_day2_choosenEvent: Events = {
    switch event_day2_choosenOption {
    case 1: return event_day2_afterChoosing_option1
    case 2: return event_day2_afterChoosing_option2
    default: fatalError("Invalid Choice")
    }
}()
let event_day2_afterChoice = Events(events: [
    [.setDialogText(text: "This will be displayed whatever option I choose")]
])
//let events = event_day1 + event_day2_beforeChoice + event_day2_choosenEvent + event_day2_afterChoice

class Events {
    //MARK: Properties
    private var eventIndex = 0
    var events: [Event] = []
    
    //MARK: Initializers
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
    
    //MARK: Operator overloading
    static func + (left: Events, right: Events) -> Events {
        return Events(events: left.events + right.events)
    }
    static func += (left: inout Events, right: Events) {
        left.events = left.events + right.events
    }
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
    case presentChoices(choices: Choices)
    case goToNextScene(segueIdentifier: String)
}

typealias Event = [StoryAction]
typealias ChoiceOption = (title: String, handler: ((UIAlertAction) -> Void)?)
typealias Choices = (title: String?, message: String?, options: [ChoiceOption])
