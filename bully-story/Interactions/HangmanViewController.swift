//
//  HangmanViewController.swift
//  bully-story
//
//  Created by Cifran on 17/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit
import AVFoundation

class HangmanViewController: UIViewController {
    
    // MARK: Variables
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet var resultLabels: [UILabel]!
    @IBOutlet var resultImageViews: [UIImageView]!
    @IBOutlet var letterButtons: [CornerRadiusView]!
    @IBOutlet weak var wordStackView: UIStackView!
    @IBOutlet weak var underlineStackView: UIStackView!
    @IBOutlet weak var gradeLabel: UILabel!
    
    private var bgAudio : AVAudioPlayer!
    private var gradeValue = 0
    private var dialogVC: DialogViewController?
    private var currentWord = ""
    private var lastButtonPressed: UIButton?
    private var playCount = 0
    private var hintTimerObject: Timer?
    private var timerObject: Timer?
    private var timerCount = 60 {
        didSet {
            if timerCount < 0 {
                timerCount = 0
            }
            timerLabel.text = "\(timerCount)"
            if timerCount == 0 {
                pauseTimer()
                gameDone(image: UIImage(named: "ans_wrong")!)
            } else if timerCount == 60 {
                pauseTimer()
                startTimer()
            }
        }
    }
    
    // MARK: Inits
    
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
    
    // MARK: Functions
    private func startTimer() {
        timerObject = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            self.timerCount -= 1
        }
        hintTimerObject = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { (_) in
            guard let hintButton = self.letterButtons.filter({ (button) -> Bool in
                return self.currentWord.contains(button.titleLabel!.text!.characters.first!) && button.isEnabled
            }).first else { return }
            self.letterButtonPressed(hintButton)
        })
    }
    private func pauseTimer() {
        timerObject?.invalidate()
        hintTimerObject?.invalidate()
    }
    
    override func viewDidLoad() {
        guard let backgroundMusicData = NSDataAsset(name: "HangmanBGMusic")?.data else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. */
            bgAudio = try AVAudioPlayer(data: backgroundMusicData, fileTypeHint: AVFileType.mp3.rawValue)
            
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
        } catch {
            print(error.localizedDescription)
        }
        
        bgAudio.numberOfLoops = -1
        bgAudio.play()
        
        updateWord()
        
        // MARK: setup result views
        for i in 0...4 {
            resultImageViews[i].alpha = 0
            resultLabels[i].alpha = 0
            resultLabels[i].text = ""
        }
        nextBtn.isHidden = true
        nextBtn.alpha = 0
        nextBtn.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20)
        gradeLabel.alpha = 0
        
        startTimer()
    }
    override func viewDidDisappear(_ animated: Bool) {
        let duration = 1.0
        bgAudio.setVolume(0, fadeDuration: duration)
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { (_) in
            self.bgAudio.stop()
        }
        
    }
    
    @IBAction func letterButtonPressed(_ button: UIButton) {
        if button != lastButtonPressed {
            lastButtonPressed = button
        }
        lastButtonPressed?.backgroundColor = #colorLiteral(red: 0.4860000014, green: 0.5609999895, blue: 0.80400002, alpha: 1)
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
                lastButtonPressed?.backgroundColor = .lightGray
                lastButtonPressed?.isEnabled = false
                lastButtonPressed = nil
            }
        }
        if visibleCheck() {
            gameDone(image: UIImage(named: "ans_correct")!)
            gradeValue += 1
        }
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
            if self.updateWord() {
                self.timerCount = 60
            }
        }
    }
    
    func updateWord() -> Bool {
        // clear views
        for label in wordStackView.arrangedSubviews {
            label.removeFromSuperview()
        }
        for underline in underlineStackView.arrangedSubviews {
            underline.removeFromSuperview()
        }
        for button in letterButtons {
            button.isEnabled = true
            button.backgroundColor = #colorLiteral(red: 0.4860000014, green: 0.5609999895, blue: 0.80400002, alpha: 1)
        }
        
        // end game
        if playCount == 5 {
            animateGameEnd()
            return false
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
        guard let words = wordList() else { return true }
        currentWord = ""
        while currentWord == "" || resultLabels.contains(where: { self.currentWord == $0.text }) {
            let randomIndex = Int(arc4random_uniform(UInt32((words.count))))
            currentWord = (words[randomIndex])
        }
        
        //add labels
        let characters = Array(currentWord.characters)
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
        return true
    }
    
    @IBAction func onTapNextBtn(_ sender: Any) {
        self.dialogVC?.next()
        let transition: CATransition = CATransition()
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: true)
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
    
    func wrongGuess() {
        lastButtonPressed?.backgroundColor = .lightGray
        lastButtonPressed?.isEnabled = false
        lastButtonPressed = nil
        timerCount -= 5
    }
    
    private func animateGameEnd() {
        pauseTimer()
        timerLabel.alpha = 0
        
        for button in self.letterButtons {
            button.isUserInteractionEnabled = false
            UIView.animate(withDuration: TimeInterval(arc4random_uniform(4) + 2)) {
                button.frame = CGRect(x: button.frame.minX, y: button.frame.maxY+self.view.frame.height, width: button.frame.width, height: button.frame.height)
            }
        }
        
        nextBtn.isHidden = false
        nextBtn.transform = .init(scaleX: 0.1, y: 0.1)
        gradeLabel.transform = .init(scaleX: 0.1, y: 0.1)
        gradeLabel.transform = .init(rotationAngle: CGFloat.pi)
        gradeLabel.text = String(gradeValue*100/playCount)
        
        UIView.animateKeyframes(withDuration: 2.5, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.gradeLabel.alpha = 1
                self.gradeLabel.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.4, animations: {
                self.nextBtn.alpha = 1
                self.nextBtn.transform = .identity
            })
        }, completion: nil)
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
