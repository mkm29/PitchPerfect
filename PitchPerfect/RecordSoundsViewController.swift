//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Mitch Murphy on 3/14/16.
//  Copyright © 2016 Mitch Murphy. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    var recordedAudio: RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //audioRecorder.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        progressLabel.hidden = true
        stopButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        progressLabel.hidden = false
        recordButton.enabled = false
        stopButton.hidden = false
        
        // now record the audio
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        //let currentDateTime = NSDate()
        //let formatter = NSDateFormatter()
        //formatter.dateFormat = "ddMMyyyy-HHmmss"
        //let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        // the audio recording is now finished, 
        // first save the recording
        if flag {
            recordedAudio = RecordedAudio()
            recordedAudio.filePath = recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
            
            
            // then segue to the next scene
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        } else {
            print("Recording did not finish successfully")
            recordButton.enabled = true
            stopButton.hidden = true
        }
        
    }
    
    @IBAction func stopRecording(sender: UIButton) {
        progressLabel.hidden = true
        //recordButton.hidden = false
        stopButton.hidden = true
        recordButton.enabled = true
        
        //Inside func stopAudio(sender: UIButton)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
}

