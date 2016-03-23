//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Mitch Murphy on 3/19/16.
//  Copyright © 2016 Mitch Murphy. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var recordedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioEngine = AVAudioEngine()
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: recordedAudio.filePath)
            audioPlayer.enableRate = true
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSoundSlow(sender: UIButton) {
        // its a good idea to always stop the audio player before playing and sounds
        playSoundAtRate(0.5)
    }

    @IBAction func playSoundFast(sender: UIButton) {
        // its a good idea to always stop the audio player before playing and sounds
        playSoundAtRate(1.5)
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        
        var pitchPlayer = AVAudioPlayerNode()
        var timePitch = AVAudioUnitTimePitch()
        
        timePitch.pitch = 1000
        
        audioEngine.attachNode(pitchPlayer)
        audioEngine.attachNode(timePitch)
        print("Play sound with high pitch")
        
        // need to create an NSURL from the recordedAudio.filePath
        let audioFile = try! AVAudioFile(forReading: recordedAudio.filePath)
        
        audioEngine.connect(pitchPlayer, to: timePitch, format: audioFile.processingFormat)
        audioEngine.connect(timePitch, to: audioEngine.outputNode, format: audioFile.processingFormat)
        pitchPlayer.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        pitchPlayer.play()
        
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        if audioPlayer.playing {
            audioPlayer.stop()
        }
    }
    
    func playSoundAtRate(rate: Float) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        audioPlayer.rate = rate
        //audioPlayer.enableRate = true
        audioPlayer.play()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
