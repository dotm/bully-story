//
//  HangmanViewController.swift
//  bully-story
//
//  Created by Cifran on 17/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet var resultLabels: [UILabel]!
    @IBOutlet var resultImageViews: [UIImageView]!
    @IBOutlet var letterButtons: [CornerRadiusView]!
    @IBOutlet weak var wordStackView: UIStackView!
    @IBOutlet weak var underlineStackView: UIStackView!
    
    var dialogVC: DialogViewController?
    
    private var lastButtonPressed: UIButton?
    private var playCount = 0
    private var timerObject: Timer?
    private var timerCount = 60 {
        didSet {
            if timerCount < 0 {
                timerCount = 0
            }
            timerLabel.text = "\(timerCount)"
            if timerCount == 0 {
                timerObject?.invalidate()
                gameDone(image: UIImage(named: "ans_wrong")!)
            } else if timerCount == 60 {
                timerObject?.invalidate()
                timerObject = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                        self.timerCount -= 1
                }
            }
        }
    }
    
    convenience init() {
        self.init(dialogVC: nil)
    }
    
    init(dialogVC: DialogViewController?) {
        self.dialogVC = dialogVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        
        updateWord()
        
        
        // MARK: setup result views
        for i in 0...4 {
            resultImageViews[i].alpha = 0
            resultLabels[i].alpha = 0
            resultLabels[i].text = ""
        }
        
        timerObject = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            self.timerCount -= 1
        }
        nextBtn.isHidden = true
    }
    
    @IBAction func letterButtonPressed(_ button: UIButton) {
        if button != lastButtonPressed {
            lastButtonPressed = button
        }
        lastButtonPressed?.backgroundColor = #colorLiteral(red: 0.6500415206, green: 0.80372715, blue: 0.9613605142, alpha: 1)
        var correct = false
        if let guess = lastButtonPressed?.titleLabel?.text {
            for subview in wordStackView.arrangedSubviews {
                if let label = subview as? UILabel {
                    if label.text == guess {
                        label.alpha = 1
                        correct = true
                    }
                }
            }
            if correct == false {
                wrongGuess()
            } else {
                lastButtonPressed?.backgroundColor = .darkGray
                lastButtonPressed?.isEnabled = false
                lastButtonPressed = nil
            }
        }
        if visibleCheck() {
            gameDone(image: UIImage(named: "ans_correct")!)
        }
    }
    
    func visibleCheck() -> Bool {
        for subview in wordStackView.arrangedSubviews {
            if let label = subview as? UILabel {
                if label.alpha == 0 {
                    return false
                }
            }
        }
        return true
    }
    
    func gameDone(image: UIImage) {
        for button in letterButtons {
            button.isEnabled = false
        }
        let resultLabel = resultLabels[playCount-1]
        let resultImageView = resultImageViews[playCount-1]
        
        var resultString = "";
        for subview in wordStackView.arrangedSubviews {
            if let label = subview as? UILabel {
                resultString += label.text!
            }
        }
        resultLabel.text = resultString
        resultImageView.image = Helper().resizeImage(image: image, targetSize: CGSize(width: 20, height: 20))
        
        UIView.animate(withDuration: 1) {
            resultLabel.alpha = 1
        }
        resultImageView.alpha = 1
        resultImageView.transform = .init(scaleX: 5, y: 5)
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            resultImageView.transform = .identity
        }) { _ in
            self.updateWord()
            self.timerCount = 60
        }
    }
    
    func wrongGuess() {
        lastButtonPressed?.backgroundColor = .darkGray
        lastButtonPressed?.isEnabled = false
        lastButtonPressed = nil
        timerCount -= 5
    }
    
    func updateWord() {
        // clear views
        for label in wordStackView.arrangedSubviews {
            label.removeFromSuperview()
        }
        for underline in underlineStackView.arrangedSubviews {
            underline.removeFromSuperview()
        }
        for button in letterButtons {
            button.isEnabled = true
            button.backgroundColor = #colorLiteral(red: 0.6500415206, green: 0.80372715, blue: 0.9613605142, alpha: 1)
        }
        
        //end game
        if playCount == 5 {
            timerObject?.invalidate()
            timerLabel.alpha = 0
            nextBtn.isHidden = false
            return
        }
        
        playCount += 1
        
        // get random word
        func wordList() -> [String]? {
            guard let url = Bundle.main.url(forResource: "wordList", withExtension: "txt") else {
                return nil
            }
            let content = try! String(contentsOf: url)
            return content.components(separatedBy: "\n")
        }
        guard let words = wordList() else { return }
        var word = ""
        while word == "" || resultLabels.contains(where: { (label) -> Bool in
            return word == label.text
        }) {
            let randomIndex = Int(arc4random_uniform(UInt32((words.count))))
            word = (words[randomIndex])
        }
        
        //add labels
        let characters = Array(word.characters)
        for character in characters {
            let label = UILabel()
            label.text = String(character)
            label.font = UIFont.systemFont(ofSize: 24)
            label.textAlignment = .center
            label.alpha  = 0
            wordStackView.addArrangedSubview(label)
            
            label.widthAnchor.constraint(equalToConstant: 24).isActive = true
            label.layoutIfNeeded()
            
            let underline = UILabel()
            underline.text = "_"
            underline.font = UIFont.systemFont(ofSize: 45)
            underline.textAlignment = .center
            underlineStackView.addArrangedSubview(underline)
            
            underline.widthAnchor.constraint(equalToConstant: 24).isActive = true
            underline.layoutIfNeeded()
        }
    }
    
    @IBAction func onTapNextBtn(_ sender: Any) {
        self.dialogVC?.next()
        self.dismiss(animated: true)
    }
}


@IBDesignable
class CornerRadiusView : UIButton {
    @IBInspectable var cornerRadius: CGFloat = -1
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}
