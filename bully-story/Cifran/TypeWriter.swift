//
//  TypeWriter.swift
//  bully-story
//
//  Created by Cifran on 19/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class TypeWriter {
    var textView: UITextView!
    var text: String!
    private var index = 0
    
    init(textView: UITextView, text: String) {
        self.textView = textView
        self.text = text
    }
    
    private func addCharacterToTextView(){
        let index = text.index(text.startIndex, offsetBy: self.index)
        let substring = text.prefix(upTo: index)
        textView.text = String(substring)
        
        self.index += 1
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: false) { (_) in
            if self.textView.text != self.text {
                self.addCharacterToTextView()
            }
        }
    
    }
    func animate() {
        addCharacterToTextView()
    }
    
    func finishTextAnimation() {
        textView.text = self.text
    }
    
}
