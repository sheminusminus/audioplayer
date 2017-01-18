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
	
	
	
	// data
	var songTitle: String = ""
	var songArtist: String = ""
	var filePath: URL!
	
	
	
    // RFERENCE TO LABELS
    // "HOW ARE WE SUPPOSE TO TALK ABOUT THEM ON THIS SHEET"
    @IBOutlet weak var labelForArtist: UILabel!
    @IBOutlet weak var labelForTitle: UILabel!
	
    
    var player : AVAudioPlayer!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		// Do any additional setup after loading the view.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	
	func playMusic() {
		
		do {
			player = try? AVAudioPlayer(contentsOf: filePath)
			player.delegate = self
			player.play()
		}
		catch {
			print("error playing song file")
		}
		
	}
	
	func stopMusic() {
		
		player.stop()
	
	}
	
	func pauseMusic() {
		
		player.pause()
		
	}
	
	
	func displaySongInfo() {
		
		labelForTitle.text = songTitle
		labelForArtist.text = songArtist
		
	}
	
	func closePlayer() {
		
		self.dismiss(animated: true, completion: nil)
	}
	
	
	
	
	// MARK: actions
    @IBAction func playButton(_ sender: UIButton) {
		
		if player.isPlaying {
			return
		}
		else {
			playMusic()
		}
		
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
		
		stopMusic()
		closePlayer()
		
    }
    
    
    @IBAction func pauseButton(_ sender: UIButton) {
		
		pauseMusic()
		
    }
    
    
    
    
    
    
    
    // extra challengs : auto play song when our NEW view pops up with ablity to stop
    // youll need to set properties in THIS player class to make that happemn

    
    


}
