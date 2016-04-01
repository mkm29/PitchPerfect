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
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vader }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    @IBAction func playSoundForButton(sender: UIButton) {
        print("Play sound from button tapped")
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        print("Stop button pressed")
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
