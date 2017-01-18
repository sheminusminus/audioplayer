//
//  AudioManager.swift
//  AudioPlayer
//
//  Created by Emily Kolar on 1/18/17.
//  Copyright © 2017 Emily Kolar. All rights reserved.
//

import Foundation
import UIKit

class AudioManager {
	
	static let mgr = AudioManager()
	
	private var currentTitle: String!
	private var currentArtist: String!
	private var currentFilePath: URL!
	private var currentSong: Song?
	private var currentSender: UIViewController?
	
	private init() {
		
		currentTitle = ""
		currentArtist = ""
		currentFilePath = URL(fileURLWithPath: "")
		currentSender = nil
		currentSong = nil
	}
	
	var song: Song {
		get {
			return currentSong!
		}
		set(newValue) {
			currentSong = newValue
		}
	}

	
	var sender: UIViewController? {
		get {
			return currentSender!
		}
		set(newValue) {
			currentSender = newValue
		}
	}
	
	private func _popupPlayer() {
		
		// TO HAVE PlayScreen pop up
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let playScreen = storyboard.instantiateViewController(withIdentifier: "PlayScreen") as! PlayerViewController
		
		
		playScreen.filePath = song.fileName
		playScreen.songTitle = song.title
		playScreen.songArtist = song.artist
		
		
		// will present the PlayScreen
		sender!.present(playScreen, animated: true, completion: {
			
			playScreen.playMusic()
			
		})
		
	}
	
	
	// PUBLIC METHODS
	
	func popupPlayer(senderVC: UIViewController, newSong: Song) {
		sender = senderVC
		song = newSong
		_popupPlayer()
	}
	
	
}
