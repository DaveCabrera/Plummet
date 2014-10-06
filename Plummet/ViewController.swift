//
//  ViewController.swift
//  Plummet
//
//  Detects free fall
//  Created by David Cabrera on 9/23/14.
//  Copyright (c) 2014 David Cabrera. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    let motionManager: CMMotionManager = CMMotionManager()
    var filePath: String = NSBundle.mainBundle().pathForResource("sound", ofType: "mp3")!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // default is the duke nukem sound
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: filePath), error: nil)
        player?.delegate = self

        if motionManager.accelerometerAvailable {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue(), withHandler: {
                (data, error) in
                let currentX: Double = data.acceleration.x
                let currentY: Double = data.acceleration.y
                let currentZ: Double = data.acceleration.z
                
                var totalAcceleration: Double = sqrt(pow(currentX, 2) + pow(currentY, 2) + pow(currentZ, 2))
                print(totalAcceleration)
                var threshold: Double = 0.06
                
                if (totalAcceleration < threshold && self.player?.playing != true){
                    print("Free fall! \n")
                    print("Total Acceleration: \(totalAcceleration) \n")
                    print("Y value: \(currentY) \n")
                    self.player?.play()
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dukeNukemButtonTapped(sender: UIButton) {
        filePath = NSBundle.mainBundle().pathForResource("sound", ofType: "mp3")!
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: filePath), error: nil)
        player?.delegate = self
        self.player?.play()
    }
    
    @IBAction func slowClapButtonTapped(sender: UIButton) {
        filePath = NSBundle.mainBundle().pathForResource("Portal_Slow_Clap", ofType: "mp3")!
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: filePath), error: nil)
        player?.delegate = self
        self.player?.play()
    }
    
    @IBAction func simpsonsButtonTapped(sender: UIButton) {
        filePath = NSBundle.mainBundle().pathForResource("Simpsons", ofType: "mp3")!
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: filePath), error: nil)
        player?.delegate = self
        self.player?.play()
    }
    
    @IBAction func breakingItButtonTapped(sender: UIButton) {
        filePath = NSBundle.mainBundle().pathForResource("Portal_Breaking_It", ofType: "mp3")!
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: filePath), error: nil)
        player?.delegate = self
        self.player?.play()
    }
    
    @IBAction func goodJobButtonTapped(sender: UIButton) {
        filePath = NSBundle.mainBundle().pathForResource("Portal_Good_Job", ofType: "mp3")!
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: filePath), error: nil)
        player?.delegate = self
        self.player?.play()
    }
    
    
}

