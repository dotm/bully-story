//
//  TypeWriter.swift
//  bully-story
//
//  Created by Cifran on 19/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class TypeWriter {
    var timer: Timer!
    var textView: UITextView!
    var text: String!
    
    init(textView: UITextView, text: String) {
        self.textView = textView
        self.text = text
    }
    
    func animate() {
        var charIndex = 0
        var charArr: [Character] = []
        
        for char in text {
            charArr.append(char)
        }
        
        func typeLetter(_ param: Timer?) -> Void {
            var timer = param
            if charIndex < charArr.count {
                textView.text = textView.text + String(charArr[charIndex])
                //                let randomInterval = Double((arc4random_uniform(8)+1))/40
                timer?.invalidate()
                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: typeLetter)
            } else {
                timer?.invalidate()
            }
            charIndex += 1
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: typeLetter)
    }
    
    func interruptAnimation() {
        timer.invalidate()
        textView.text = self.text
    }
    
}
