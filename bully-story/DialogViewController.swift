//
//  DialogViewController.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 11/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
    
        if ((cString.count) != 6) {
            self.init(
                red: 0,
                green: 0,
                blue: 0,
                alpha: 1
            )
        }else{
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
        
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }
    }
}

class DialogViewController: UIViewController {
    
    //MARK: Properties
    var events: Events!
    let defaultBackgroundColor = UIColor(hex: "D2DAF6")
    let borderColor = UIColor(hex: "979797")
    let borderWidth = CGFloat(1)
    let dialogContainerPadding = CGFloat(10)
    
    var dialogTextFontStyle: UIFont {return UIFont(name: "PT Sans", size: 20)! }
    var characterNameFontStyle: UIFont {return UIFont(name: "PTSans-Bold", size: 22)!}
    
    //MARK: Outlets
    weak var dialogContainer: UIView!
    weak var backgroundImage: UIImageView!
    weak var arrowDownIcon: UIImageView?
    
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDialogContainer()
        setupBackgroundImage()
        DialogAudioPlayer.setupAudioPlayer()
    }
    
    //MARK: Actions
    @objc func next(_ sender: UITapGestureRecognizer? = nil) {
        typeWriter?.interruptAnimation()
        let nextEvent: Event? = events.goToNextEvent()
        executeEvent(nextEvent)
    }
    
    //MARK: Private methods (helpers)
    func executeEvent(_ event: Event?){
        guard event != nil else {
            return
        }
        for action in event! {
            executeAction(action)
        }
    }
    private func executeAction(_ action: StoryAction){
        switch action {
        case let .setBackgroundImage(imageName):
            changeBackgroundImage(imageName)
        case let .presentChoices(choices):
            presentChoices(choices)
        case let .goToNextScene(viewController):
            goToNextScene(viewController)
        case let .presentDialog(characterName, characterNamePosition, characterImage, characterImagePosition, dialogText):
            presentDialog(characterName, characterNamePosition, characterImage, characterImagePosition, dialogText)
        case let .presentNarration(text):
            presentNarration(text)
        case let .playBGM(filename):
            DialogAudioPlayer.setAndPlay_BGM(mp3_filename: filename)
        case .stopBGM:
            DialogAudioPlayer.stopBackgroundMusic()
        case let.playSFX(filename, delay):
            DialogAudioPlayer.setAndPlay_SFX(mp3_filename: filename, delay: delay)
        case .stopSFX:
            DialogAudioPlayer.stopSoundEffect()
        }
    }
    func goToNextScene(_ viewController: UIViewController){
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromRight
        view.window?.layer.add(transition, forKey: kCATransition)
        self.present(viewController, animated: false, completion: nil)
    }
    private func changeBackgroundImage(_ newImageName: String){
        UIView.transition(with: backgroundImage, duration: 1, options: .transitionCrossDissolve, animations: {
            self.backgroundImage.image = UIImage(named: newImageName)
        }, completion: nil)
    }
    private func presentDialog(
        _ characterName: String,
        _ characterNamePosition: DialogPosition,
        _ characterImage: String?,
        _ characterImagePosition: DialogPosition,
        _ dialogText: String
    ){
        emptyDialogContainer()
        setupDialogTextView(text: dialogText)
        setupCharacterName(text: characterName, position: characterNamePosition)
        setupCharacterImage(imageName: characterImage, position: characterImagePosition)
        setupTapGestureRecognizer_forDialog()
    }
    private func presentNarration(_ text: String){
        emptyDialogContainer()
        setupNarrationTextView(text: text)
        setupTapGestureRecognizer_forDialog()
    }
    private func presentChoices(_ choices: Choices){
        emptyDialogContainer()
        view.gestureRecognizers?.forEach(view.removeGestureRecognizer)
        setupChoiceTitle(title: choices.title)
        setupChoiceOptions(options: choices.options)
    }
    
    private func emptyDialogContainer(){
        dialogContainer.subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }
    }
    
    //MARK: Layout setup
    private func setupDialogContainer(){
        let dialogContainer = UIView()
        view.addSubview(dialogContainer)
        
        dialogContainer.backgroundColor = UIColor(hex: "7C8FCD")
        dialogContainer.layer.zPosition = 1
        
        dialogContainer.translatesAutoresizingMaskIntoConstraints = false
        dialogContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dialogContainer.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        dialogContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.30).isActive = true
        dialogContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.dialogContainer = dialogContainer
    }
    private func setupCharacterName(text: String, position: DialogPosition) {
        let dialogCharacterName = UITextView()
        dialogContainer.addSubview(dialogCharacterName)
        
        dialogCharacterName.layer.zPosition = 3
        dialogCharacterName.isUserInteractionEnabled = false
        dialogCharacterName.isScrollEnabled = false
        dialogCharacterName.text = text
        dialogCharacterName.font = characterNameFontStyle
        dialogCharacterName.backgroundColor = defaultBackgroundColor
        dialogCharacterName.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        dialogCharacterName.layer.borderColor = borderColor.cgColor
        dialogCharacterName.layer.borderWidth = borderWidth
        dialogCharacterName.layer.cornerRadius = 10
        dialogCharacterName.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        dialogCharacterName.translatesAutoresizingMaskIntoConstraints = false
        switch position {
        case .left:
            dialogCharacterName.leadingAnchor.constraint(equalTo: dialogContainer.leadingAnchor, constant: dialogContainerPadding).isActive = true
        case .right:
            dialogCharacterName.trailingAnchor.constraint(equalTo: dialogContainer.trailingAnchor, constant: -dialogContainerPadding).isActive = true
        }
        dialogCharacterName.bottomAnchor.constraint(equalTo: dialogContainer.topAnchor).isActive = true
        dialogCharacterName.widthAnchor.constraint(equalTo: dialogContainer.widthAnchor, multiplier: 0.4).isActive = true
    }
    private func setupCharacterImage(imageName: String?, position: DialogPosition){
        let IMAGE_TAG = 98599
        func removeCharacterImage(){
            dialogContainer.subviews.forEach { (view) in
                if view.tag == IMAGE_TAG {
                    view.removeFromSuperview()
                }
            }
        }
        
        guard let name = imageName, let image = UIImage(named: name) else {
            removeCharacterImage()
            return
        }
        
        let characterImage = UIImageView()
        characterImage.tag = IMAGE_TAG
        characterImage.image = image
        dialogContainer.addSubview(characterImage)
        
        characterImage.layer.zPosition = 2
        characterImage.contentMode = .scaleAspectFit
        
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        switch position {
        case .left:
            characterImage.leadingAnchor.constraint(equalTo: dialogContainer.leadingAnchor, constant: dialogContainerPadding).isActive = true
        case .right:
            characterImage.trailingAnchor.constraint(equalTo: dialogContainer.trailingAnchor, constant: -dialogContainerPadding).isActive = true
        }
        characterImage.bottomAnchor.constraint(equalTo: dialogContainer.topAnchor).isActive = true
        let multiplier = CGFloat(0.3)
        characterImage.heightAnchor.constraint(equalToConstant: image.size.height * multiplier).isActive = true
        characterImage.widthAnchor.constraint(equalToConstant: image.size.width * multiplier).isActive = true
    }
    
    var typeWriter: TypeWriter?
    
    func createDialogText(text: String) -> UITextView {
        let dialogText = UITextView()
        
        dialogText.layer.zPosition = 2
        dialogText.isUserInteractionEnabled = false
        dialogText.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        dialogText.setContentOffset(CGPoint.zero, animated: false)
        dialogText.backgroundColor = defaultBackgroundColor
        dialogText.font = dialogTextFontStyle
        dialogText.layer.cornerRadius = 10
        dialogText.layer.borderColor = borderColor.cgColor
        dialogText.layer.borderWidth = borderWidth
        
        let editedText = text.replacingOccurrences(of: "#name", with: username)
        typeWriter = TypeWriter(textView: dialogText, text: editedText)
        typeWriter?.animate()
        
        return dialogText
    }
    private func setupChoiceTitle(title: String?){
        let dialogText = createDialogText(text: title ?? "")
        dialogContainer.addSubview(dialogText)
        
        dialogText.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        dialogText.textAlignment = .center
        
        dialogText.translatesAutoresizingMaskIntoConstraints = false
        dialogText.leadingAnchor.constraint(equalTo: dialogContainer.leadingAnchor, constant: dialogContainerPadding).isActive = true
        dialogText.trailingAnchor.constraint(equalTo: dialogContainer.trailingAnchor, constant: -dialogContainerPadding).isActive = true
        dialogText.topAnchor.constraint(equalTo: dialogContainer.topAnchor, constant: dialogContainerPadding).isActive = true
        dialogText.heightAnchor.constraint(equalTo: dialogContainer.heightAnchor, multiplier: 0.3).isActive = true
    }
    
    private func setupDialogTextView(text: String) {
        let dialogText = createDialogText(text: text)
        dialogContainer.addSubview(dialogText)
        
        dialogText.translatesAutoresizingMaskIntoConstraints = false
        dialogText.leadingAnchor.constraint(equalTo: dialogContainer.leadingAnchor, constant: dialogContainerPadding).isActive = true
        dialogText.trailingAnchor.constraint(equalTo: dialogContainer.trailingAnchor, constant: -dialogContainerPadding).isActive = true
        dialogText.topAnchor.constraint(equalTo: dialogContainer.topAnchor, constant: dialogContainerPadding).isActive = true
        dialogText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        setupArrowDownIcon(parent: dialogText)
    }
    private func setupNarrationTextView(text: String) {
        let narrationText = createDialogText(text: text)
        narrationText.textAlignment = .center
        narrationText.layer.backgroundColor = UIColor(hex: "F8F9FF").cgColor
        narrationText.layer.borderColor = UIColor(hex: "979797").cgColor
        narrationText.font = UIFont(name: "PTSans-Italic", size: 22)
        dialogContainer.addSubview(narrationText)
        
        narrationText.translatesAutoresizingMaskIntoConstraints = false
        narrationText.leadingAnchor.constraint(equalTo: dialogContainer.leadingAnchor, constant: dialogContainerPadding).isActive = true
        narrationText.trailingAnchor.constraint(equalTo: dialogContainer.trailingAnchor, constant: -dialogContainerPadding).isActive = true
        narrationText.topAnchor.constraint(equalTo: dialogContainer.topAnchor, constant: dialogContainerPadding).isActive = true
        narrationText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        setupArrowDownIcon(parent: narrationText)
    }
    private func setupArrowDownIcon(parent: UIView){
        let arrowDownIcon = UIImageView()
        arrowDownIcon.image = UIImage(named: "icon-arrow-down")
        arrowDownIcon.layer.zPosition = 10
        dialogContainer.addSubview(arrowDownIcon)
        
        arrowDownIcon.translatesAutoresizingMaskIntoConstraints = false
        arrowDownIcon.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -dialogContainerPadding).isActive = true
        arrowDownIcon.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -dialogContainerPadding).isActive = true
        arrowDownIcon.heightAnchor.constraint(equalToConstant: arrowDownIcon.image!.size.height).isActive = true
        arrowDownIcon.widthAnchor.constraint(equalToConstant: arrowDownIcon.image!.size.width).isActive = true
        
        self.arrowDownIcon = arrowDownIcon
    }
    private func animateArrowDownIcon(){
        let distance = CGFloat(10)
        guard arrowDownIcon != nil else {
            return
        }
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: .repeat, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.arrowDownIcon?.frame.origin.y += distance
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.arrowDownIcon?.frame.origin.y -= distance
            })
        }, completion: nil)
    }
    private func setupBackgroundImage(){
        let backgroundImage = UIImageView()
        view.addSubview(backgroundImage)
        
        backgroundImage.layer.zPosition = 0
        backgroundImage.image = UIImage(named: "placeholderImage")
       
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.70).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        self.backgroundImage = backgroundImage
    }
    private func setupTapGestureRecognizer_forDialog(){
        view.gestureRecognizers?.forEach(view.removeGestureRecognizer)
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(next(_:)))
        view.addGestureRecognizer(recognizer)
    }
    
    private func setupChoiceOptions(options: [ChoiceOption]){
        let subviews = options.map({ (option) -> UIView in
            return createChoiceOption(title: option.title, handler: option.handler)
        })
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = CGFloat(10)
        dialogContainer.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: dialogContainer.leadingAnchor, constant: 2*dialogContainerPadding).isActive = true
        stackView.trailingAnchor.constraint(equalTo: dialogContainer.trailingAnchor, constant: -2*dialogContainerPadding).isActive = true
        stackView.heightAnchor.constraint(equalTo: dialogContainer.heightAnchor, multiplier: 0.4).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -dialogContainerPadding).isActive = true
    }
    private func createChoiceOption(title: String, handler: ChoiceHandler) -> UIView {
        let label = OptionLabel()
        label.text = title
        label.handler = handler!
        
        return label
    }
}

class OptionLabel: UILabel {
    var handler: ()->() = {
        print("executing default handler")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    func setupLayout(){
        self.layer.backgroundColor = UIColor(hex: "F8F9FF").cgColor
        self.layer.borderColor = UIColor(hex: "979797").cgColor
        self.layer.borderWidth = CGFloat(1)
        self.textAlignment = .center
        self.layer.cornerRadius = CGFloat(10)
        self.font = UIFont(name: "PT Sans", size: 20)
        
        self.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handler()
    }
}
