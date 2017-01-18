//
//  PlayerViewController.swift
//  AudioPlayer
//
//  Created by Logan Caracci on 1/12/17.
//  Copyright © 2017 Emily Kolar. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation
// stop button WILL DISSMISS AND PUASE WILL JUST PAUSE
class PlayerViewController: UIViewController, AVAudioPlayerDelegate{
    
    
    // REFERENCE TO THE PROGRESS BAR
    // "HOW ELSE ARE WE SUPPOSE TO TALK ABOUT IT"
    @IBOutlet weak var progressSongBar: UIProgressView!
    
    
    // RFERENCE TO LABELS
    // "HOW ARE WE SUPPOSE TO TALK ABOUT THEM ON THIS SHEET"
    @IBOutlet weak var labelForArtist: UILabel!
    @IBOutlet weak var labelForTitle: UILabel!
    
    var player : AVAudioPlayer!
   
    
    
    @IBAction func playButton(_ sender: UIButton) {
        
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        
    }
    
    
    @IBAction func pauseButton(_ sender: UIButton) {
        
    }
    
    
    
    
    
    
    
    // extra challengs : auto play song when our NEW view pops up with ablity to stop
    // youll need to set properties in THIS player class to make that happemn

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
