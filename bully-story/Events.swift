//
//  Events.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 09/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

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

enum DialogPosition {
    case left, right
}
enum StoryAction {
    case setBackgroundImage(imageName: String)
    case presentDialog(
        characterName: String,
        characterNamePosition: DialogPosition,
        characterImage: String?,
        characterImagePosition: DialogPosition,
        dialogText: String
    )
    case presentNarration(text: String)
    case presentChoices(choices: Choices)
    case goToNextScene(viewController: UIViewController)
}

typealias Event = [StoryAction]
typealias ChoiceHandler = (() -> Void)?
typealias ChoiceOption = (title: String, handler: ChoiceHandler)
typealias Choices = (title: String?, options: [ChoiceOption])
