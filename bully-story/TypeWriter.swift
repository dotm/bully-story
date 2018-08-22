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
    var completionHandler: (()->())?
    private var index = 0
    
    init(textView: UITextView, text: String, completionHandler: (()->())? = nil) {
        self.textView = textView
        self.text = text
        self.completionHandler = completionHandler
    }
    
    private func addCharacterToTextView(){
        let index = text.index(text.startIndex, offsetBy: self.index)
        let substring = text.prefix(upTo: index)
        textView.text = String(substring)
        
        self.index += 1
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: false) { (_) in
            if self.textView.text != self.text {
                self.addCharacterToTextView()
            }else{
                self.completionHandler?()
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
