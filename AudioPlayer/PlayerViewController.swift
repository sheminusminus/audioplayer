//
//  PlayerViewController.swift
//  AudioPlayer
//
//  Created by Emily Kolar, Alex Flores on 1/12/17.
//  Copyright © 2017 Emily Kolar, Alex Flores. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation


class PlayerViewController: UIViewController, AVAudioPlayerDelegate{
    

	    // RFERENCE TO LABELS
    // "HOW ARE WE SUPPOSE TO TALK ABOUT THEM ON THIS SHEET"
    @IBOutlet weak var labelForArtist: UILabel!
    @IBOutlet weak var labelForTitle: UILabel!
	
	
	
	// RFERENCE TO PROGRESS BAR
	// "HOW ARE WE SUPPOSE TO TALK ABOUT IT ON THIS SHEET"
	@IBOutlet weak var progressSongBar: UIProgressView!
	
	
	
	// data
	var songTitle: String!
	var songArtist: String!
	var filePath: URL!
	
	
	
	// audio player
	var player : AVAudioPlayer!
	
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
        //
		if filePath == nil {
			filePath = URL(fileURLWithPath: "")
		}
		if songTitle == nil {
			songTitle = ""
		}
		if songArtist == nil {
			songTitle = ""
		}
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	

	func displaySongInfo() {
		
		labelForTitle.text = songTitle
		labelForArtist.text = songArtist
		
	}
	
	
	func playMusic() {
		
		do {
			player = try AVAudioPlayer(contentsOf: filePath)
			player.delegate = self
			player.prepareToPlay()
			player.play()
		}
		catch let error {
			print(error.localizedDescription)
		}
		
	}
	
	
	func stopMusic() {
		
		player.stop()
	}
	

	func pauseOrRestart() {
		
		if player.isPlaying {
			player.pause()
		}
		else {
			player.play()
		}
		
	}
	
	
	func closePlayer() {
		
		self.dismiss(animated: true, completion: nil)
	}
	
	
	
	
	
	// MARK: actions
	
    @IBAction func playButton(_ sender: UIButton) {
		
		pauseOrRestart()
		
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
		
		stopMusic()
		closePlayer()
		
    }
    
    
    @IBAction func pauseButton(_ sender: UIButton) {
		
		pauseOrRestart()

    }
    
    
    
    
    
    
    
    // extra challengs : auto play song when our NEW view pops up with ablity to stop
    // youll need to set properties in THIS player class to make that happemn

    
    


}
