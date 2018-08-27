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
    let STACK_VIEW_TAG = 97584657
    let NARRATION_TAG = 65389
    
    var dialogTextFontStyle: UIFont {return UIFont(name: "PT Sans", size: 20)! }
    var characterNameFontStyle: UIFont {return UIFont(name: "PTSans-Bold", size: 22)!}
    
    var backgroundImageName: String = "" {
        didSet {
            changeBackgroundImage(backgroundImageName)
        }
    }
    
    //MARK: Outlets
    weak var dialogContainer: UIView!
    weak var backgroundImage: UIImageView!
    weak var arrowDownIcon: UIImageView?
    
    //MARK: Lifecycle hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHomeButton()
        setupDialogContainer()
        setupBackgroundImage()
        DialogAudioPlayer.setupAudioPlayer()
    }
    private func setupHomeButton(){
        let button = UIButton()
        button.layer.zPosition = 20
        button.backgroundColor = UIColor(named:"purple-light")
//        button.titleEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3)
        button.layer.cornerRadius = CGFloat(10)
//        button.setTitle("Home", for: .normal)
        let img = Helper().resizeImage(image: UIImage(named: "home")!, targetSize: CGSize(width: 15, height: 15)).withRenderingMode(.alwaysTemplate)
        button.setImage(img, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -35).isActive = true
//        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    @objc func goToHome(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homePage = storyboard.instantiateViewController(withIdentifier: "home") as! UINavigationController
        DialogAudioPlayer.stopBackgroundMusic()
        DialogAudioPlayer.stopSoundEffect()
        self.present(homePage, animated: true, completion: nil)
    }
    
    //MARK: Actions
    @objc func next(_ sender: UITapGestureRecognizer? = nil) {
        let displayedText = typeWriter?.textView.text
        let intendedText = typeWriter?.text
        if displayedText != intendedText {
            typeWriter?.finishTextAnimation()
        }else{
            let nextEvent: Event? = events.goToNextEvent()
            executeEvent(nextEvent)
        }
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
            backgroundImageName = imageName
        case let .presentChoices(choices):
            presentChoices(choices)
        case let .goToNextScene(viewController):
            goToNextScene(viewController)
        case let .presentDialog(characterName, characterNamePosition, characterImage, characterImagePosition, dialogText):
            presentDialog(characterName, characterNamePosition, characterImage, characterImagePosition, dialogText)
        case let .presentMonolog(text):
            presentMonolog(text)
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
    private func presentMonolog(_ text: String){
        emptyDialogContainer()
        setupMonologTextView(text: text)
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
//        setupChoiceTitle(title: choices.title)
        setupChoiceOptions(options: choices.options)
    }
    
    private func emptyDialogContainer(){
        dialogContainer.subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }
        view.subviews.forEach { (subview) in
            if subview.tag == STACK_VIEW_TAG || subview.tag == NARRATION_TAG {
                subview.removeFromSuperview()
            }
        }
    }
    
    //MARK: Layout setup
    private func setupDialogContainer(){
        let dialogContainer = UIView()
        view.addSubview(dialogContainer)
        
        dialogContainer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
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
        dialogCharacterName.text = text.replacingOccurrences(of: "#name", with: username)
        dialogCharacterName.font = characterNameFontStyle
        dialogCharacterName.backgroundColor = defaultBackgroundColor
        dialogCharacterName.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        dialogCharacterName.layer.borderColor = borderColor.cgColor
        dialogCharacterName.layer.borderWidth = borderWidth
        dialogCharacterName.layer.cornerRadius = 10
//        dialogCharacterName.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
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
        typeWriter = TypeWriter(textView: dialogText, text: editedText) {
            self.showAndAnimate_arrowDownIcon()
        }
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
    private func setupChoiceOptions(options: [ChoiceOption]){
        let subviews = options.map({ (option) -> UIView in
            return createChoiceOption(title: option.title, handler: option.handler)
        })
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = CGFloat(40)
        stackView.tag = STACK_VIEW_TAG
        view.addSubview(stackView)
        stackView.subviews.forEach { (subview) in
            subview.translatesAutoresizingMaskIntoConstraints = false
            subview.heightAnchor.constraint(equalToConstant: 35).isActive = true
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    private func createChoiceOption(title: String, handler: ChoiceHandler) -> UIView {
        let label = OptionLabel()
        label.text = title
        label.handler = handler!
        
        return label
    }
    private func setupNarrationTextView(text: String) {
        let text = createDialogText(text: text)
        text.textAlignment = .center
        text.layer.backgroundColor = UIColor(hex: "F8F9FF").cgColor
        text.layer.borderColor = UIColor(hex: "979797").cgColor
        text.font = UIFont(name: "PTSans-Italic", size: 22)
        text.tag = NARRATION_TAG
        view.addSubview(text)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        text.heightAnchor.constraint(equalToConstant: 200).isActive = true
        text.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    private func setupDialogTextView(text: String) {
        let dialogText = createDialogText(text: text)
        dialogContainer.addSubview(dialogText)
        
        dialogText.translatesAutoresizingMaskIntoConstraints = false
        dialogText.leadingAnchor.constraint(equalTo: dialogContainer.leadingAnchor, constant: dialogContainerPadding).isActive = true
        dialogText.trailingAnchor.constraint(equalTo: dialogContainer.trailingAnchor, constant: -dialogContainerPadding).isActive = true
        dialogText.topAnchor.constraint(equalTo: dialogContainer.topAnchor, constant: dialogContainerPadding).isActive = true
        dialogText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -3*dialogContainerPadding).isActive = true
        
        setupArrowDownIcon(parent: dialogText)
    }
    private func setupMonologTextView(text: String) {
        let text = createDialogText(text: text)
        text.textAlignment = .left
        text.layer.backgroundColor = UIColor(hex: "F8F9FF").cgColor
        text.layer.borderColor = UIColor(hex: "979797").cgColor
        text.font = UIFont(name: "PTSans-Italic", size: 22)
        dialogContainer.addSubview(text)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.leadingAnchor.constraint(equalTo: dialogContainer.leadingAnchor, constant: dialogContainerPadding).isActive = true
        text.trailingAnchor.constraint(equalTo: dialogContainer.trailingAnchor, constant: -dialogContainerPadding).isActive = true
        text.topAnchor.constraint(equalTo: dialogContainer.topAnchor, constant: dialogContainerPadding).isActive = true
        text.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -3*dialogContainerPadding).isActive = true
        
        setupArrowDownIcon(parent: text)
    }
    private func setupArrowDownIcon(parent: UIView){
        let arrowDownIcon = UIImageView()
        arrowDownIcon.image = UIImage(named: "icon-arrow-down")
        arrowDownIcon.layer.zPosition = 10
        arrowDownIcon.alpha = 0
        dialogContainer.addSubview(arrowDownIcon)
        
        arrowDownIcon.translatesAutoresizingMaskIntoConstraints = false
        arrowDownIcon.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -dialogContainerPadding).isActive = true
        arrowDownIcon.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -dialogContainerPadding).isActive = true
        arrowDownIcon.heightAnchor.constraint(equalToConstant: arrowDownIcon.image!.size.height).isActive = true
        arrowDownIcon.widthAnchor.constraint(equalToConstant: arrowDownIcon.image!.size.width).isActive = true
        
        self.arrowDownIcon = arrowDownIcon
    }
    private func showAndAnimate_arrowDownIcon(){
        let distance = CGFloat(10)
        guard arrowDownIcon != nil else {
            return
        }
        arrowDownIcon?.alpha = 1
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
        backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        self.backgroundImage = backgroundImage
    }
    private func setupTapGestureRecognizer_forDialog(){
        view.gestureRecognizers?.forEach(view.removeGestureRecognizer)
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(next(_:)))
        view.addGestureRecognizer(recognizer)
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
//        self.layer.backgroundColor = UIColor(hex: "F8F9FF").cgColor
        self.layer.backgroundColor = #colorLiteral(red: 0.824000001, green: 0.8550000191, blue: 0.9649999738, alpha: 1)
        self.layer.borderColor = UIColor(hex: "979797").cgColor
        self.layer.borderWidth = CGFloat(1)
        self.textAlignment = .center
        self.layer.cornerRadius = CGFloat(17)
        self.font = UIFont(name: "PT Sans", size: 20)
        
        self.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handler()
    }
}
