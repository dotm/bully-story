//
//  Events.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 09/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class Events: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(events, forKey: "events")
        aCoder.encode(eventIndex, forKey: "eventIndex")
    }
    required convenience init?(coder aDecoder: NSCoder) {
        let events = aDecoder.decodeObject(forKey:"events") as! [Event]
        let eventIndex = aDecoder.decodeInteger(forKey: "eventIndex")
        self.init(events: events, eventIndex: eventIndex)
    }
    
    //MARK: Properties
    private var eventIndex = 0
    var events: [Event] = []
    
    //MARK: Initializers
    convenience init(events: [Event]) {
        self.init(events: events, eventIndex: 0)
    }
    init(events: [Event], eventIndex: Int){
        self.events = events
        self.eventIndex = eventIndex
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
    case presentMonolog(text: String)
    case presentNarration(text: String)
    case presentChoices(choices: Choices)
    case goToNextScene(viewController: UIViewController)
    case playBGM(filename: String)
    case stopBGM()
    case playSFX(filename: String, delay: Double)
    case stopSFX()
}

typealias Event = [StoryAction]
typealias ChoiceHandler = (() -> Void)?
typealias ChoiceOption = (title: String, handler: ChoiceHandler)
typealias Choices = (title: String?, options: [ChoiceOption])
