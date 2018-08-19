//
//  DialogAudioPlayer.swift
//  bully-story
//
//  Created by Yoshua Elmaryono on 16/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit
import AVFoundation

enum DialogAudioPlayer {
    private static var BGM: AVAudioPlayer?
    private static var SFX: AVAudioPlayer?
    
    static func setupAudioPlayer(){
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error.localizedDescription)
        }
    }
    static func setAndPlay_BGM(mp3_filename: String){
        let fadeOutTime = 1.0
        BGM?.setVolume(0, fadeDuration: fadeOutTime)
        Timer.scheduledTimer(withTimeInterval: fadeOutTime, repeats: false) { (_) in
            BGM?.stop()
            setBackgroundMusic(mp3_filename: mp3_filename)
            BGM?.numberOfLoops = -1
            BGM?.play()
        }
    }
    static func stopBackgroundMusic(){
        BGM?.stop()
    }
    static func setAndPlay_SFX(mp3_filename: String, delay: Double){
        setSoundEffect(mp3_filename: mp3_filename)
        if let SFX = SFX {
            SFX.play(atTime: SFX.deviceCurrentTime + delay)
        }
    }
    static func stopSoundEffect(){
        SFX?.stop()
    }
    
    private static func setBackgroundMusic(mp3_filename: String){
        do {
            guard let backgroundMusicData = NSDataAsset(name: mp3_filename)?.data else { return }
            BGM = try AVAudioPlayer(data: backgroundMusicData, fileTypeHint: AVFileType.mp3.rawValue)
        } catch {
            print(error.localizedDescription)
        }
    }
    private static func setSoundEffect(mp3_filename: String){
        do {
            guard let soundEffectMusicData = NSDataAsset(name: mp3_filename)?.data else { return }
            SFX = try AVAudioPlayer(data: soundEffectMusicData, fileTypeHint: AVFileType.mp3.rawValue)
        } catch {
            print(error.localizedDescription)
        }
    }
}
