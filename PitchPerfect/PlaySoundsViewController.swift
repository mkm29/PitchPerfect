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
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var darthVaderButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vader }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioEngine = AVAudioEngine()
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: recordedAudio.filePath)
            audioPlayer.enableRate = true
        } catch {
            
        }
    }
    
    @IBAction func playSoundFromButton(sender: UIButton) {
        print("Play sound from button tapped")
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        if audioPlayer.playing {
            audioPlayer.stop()
        }
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
