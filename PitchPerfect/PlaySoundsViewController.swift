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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // grab the filepath for the mp3 sound to be played
        
        if let path = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            let url = NSURL(fileURLWithPath: path)
            
            do {
                // preoare the sound to be played whenever the button is pressed
                audioPlayer = try AVAudioPlayer(contentsOfURL: url)
            } catch {
                
            }
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
    
    @IBAction func stopAudio(sender: UIButton) {
        if audioPlayer.playing {
            audioPlayer.stop()
        }
    }
    
    func playSoundAtRate(rate: Float) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        audioPlayer.rate = rate
        audioPlayer.enableRate = true
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
