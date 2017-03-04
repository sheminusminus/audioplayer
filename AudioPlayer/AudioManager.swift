//
//  AudioManager.swift
//  AudioPlayer
//
//  Created by Emily Kolar, Alex Flores on 1/18/17.
//  Copyright © 2017 Emily Kolar, Alex Flores. All rights reserved.
//

import Foundation
import UIKit

class AudioManager {
	
	
	//==========================
	// MARK: properties
	//==========================
	
	
	// creates singleton instance of this object
	// "there can be only one"
	static let mgr = AudioManager()
	
	
	
	
	// private class variables
	private var _title: String!
	private var _artist: String!
	private var _fileURL: URL!
	private var _song: Song!
	private var _sender: UIViewController!
	
	
	
	
	// private init for this singleton object
	private init() {
		
		_title = ""
		_artist = ""
		_fileURL = URL(fileURLWithPath: "")

	}
	
	
	
	//==========================
	// MARK: public get/set properties
	//==========================
	
	//==========================
	// referencing one of these will return the private variable value
	// setting one of these will set the private variable value only if we allow that to happen
	// we could put additional logic inside the setters to filter bad data first, reformat something, etc
	//==========================
	
	
	
	var song: Song {
		get {
			return _song
		}
		set(newValue) {
			_song = newValue
		}
	}
	
	
	var sender: UIViewController {
		get {
			return _sender
		}
		set(newValue) {
			_sender = newValue
		}
	}
	
	
	
	//==========================
	// MARK: private methods
	//==========================
	
	
	
	private func _popupPlayer() {
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let playScreen = storyboard.instantiateViewController(withIdentifier: "PlayScreen") as! PlayerViewController
		
		
		playScreen.filePath = _song.fileName
		playScreen.songTitle = _song.title
		playScreen.songArtist = _song.artist
		
		
		sender.present(playScreen, animated: true, completion: {
			
			playScreen.playMusic()
			
		})
		
	}
	
	
	
	//==========================
	// MARK: public methods
	//==========================
	
	
	
	func popupPlayer(senderVC: UIViewController, newSong: Song) {
		
		// note that we're setting the public get/set properties here, and not the private class variables
		// that's because this method is publicly callable and they can pass anything in
		sender = senderVC
		song = newSong
		
		// we then call our own private class method, which accesses only private class variables
		_popupPlayer()
	}
	
	
}
