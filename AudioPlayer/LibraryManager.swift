//
//  LibraryManger.swift
//  AudioPlayer
//
//  Created by Emily Kolar on 1/21/17.
//  Copyright © 2017 Emily Kolar. All rights reserved.
//

import Foundation
import UIKit

class LibraryManager {
	
	static let mgr = LibraryManager()
	
	private var _library: [String: [Song]] = [String:[Song]]()
	private let _sectionHeaders: [String] = ["#", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
	
	private init() {
		_buildLibrary()
	}
	
	
	// MARK: public accessor properties
	
	var library: [String: [Song]] {
		get {
			return _library
		}
	}
	
	var sectionHeaders: [String] {
		get {
			return _sectionHeaders
		}
	}
	
	private func _addToLibrary(newSong: Song) {
		// we'll write this later
	}
	
	private func _addArtwork(addToSong: Song, image: UIImage) {
		let titleCapped = addToSong.title.capitalized
		let firstLetter = String(describing: titleCapped.characters.first)
		
		for song in _library[firstLetter]! {
			if song.title == addToSong.title {
				song.artworkImage = UIImageJPEGRepresentation(image, 1.0)!
			}
		}
	}
	
	
	private func _buildLibrary() {
		// these constants are gonna walk around this sheet and represent the song objects that include the Title,Type,Artist etc.............
		let arcadeFire = Song(initTitle: "We Used to Wait", initArtist: "Arcade Fire", initType: "Rock", initFile: URL(fileReferenceLiteralResourceName: "ArcadeFire-WeUsedToWait.m4a"))
		let brandNew = Song(initTitle: "Nobody Moves", initArtist: "Brand New", initType: "Rock", initFile: URL(fileReferenceLiteralResourceName: "BrandNew-NobodyMoves.mp3"))
		let coconutRecords = Song(initTitle: "West Coast", initArtist: "Coconut Records", initType: "Pop Rock", initFile: URL(fileReferenceLiteralResourceName: "CoconutRecords-WestCoast.m4a"))
		
		brandNew.artworkImage = UIImagePNGRepresentation(UIImage(named: "musicnote")!)!
		arcadeFire.artworkImage = UIImagePNGRepresentation(UIImage(named: "musicnote")!)!
		coconutRecords.artworkImage = UIImagePNGRepresentation(UIImage(named: "musicnote")!)!
		
		// gonna loop through the sectionHeaders and Letter is just an index essentially ????? you just made it there right ??
		for letter in _sectionHeaders {
			
			
			// WHATS HAPPENING HERE ????
			_library[letter] = [Song]()
			
			
			
			// START OF THE IF .... GET THE BALL ROLLING
			// IF LETTET WHICH WE MADE AT THE START OF THE LOOP IS EQUAL TO "A" THEN DO THIS??????
			if letter == "A" {
				
				// // ADD arcadeFire TO THE LIBRARY LETTER "A"
				// WHAT IS THE [Letter]? DOING HERE ...?????
				_library[letter]?.append(arcadeFire)
			}
				
				// IF LETTER IS "B" DO THIS ....
			else if letter == "B" {
				
				// ADD brandNew TO LIBRARY LETTER "B"
				_library[letter]?.append(brandNew)
			}
				
				// IF LETTER IS EQUAL TO "C" DO THIS ....
			else if letter == "C" {
				
				// ADD coconutRecords TO LIBRARY LETTER "C"
				_library[letter]?.append(coconutRecords)
			}
				
				// IF NONE OF THOSE ABOVE DO THIS ...
			else {
				
				//ADD brandNew TO THE REST OF THE LETTERS for now
				_library[letter]?.append(brandNew)
			}
			
		}
	}
	
	func addArtwork(addToSong: Song, image: UIImage) {
		_addArtwork(addToSong: addToSong, image: image)
	}
	
}
