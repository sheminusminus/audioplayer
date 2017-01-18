//
//  Song.swift
//  AudioPlayer
//
//  Created by Emily Kolar on 12/16/16.
//  Copyright © 2016 Emily Kolar. All rights reserved.
//

import Foundation

class Song {
	
    // LETTING THIS SHEET OF CODE KNOW A SONG USUALLY HAS ALL OF THESE THINGS..... all of these variables
	var title: String!
	var artist: String!
	var mediaType: String!
	var fileName: String!
	var genre: String!
	
    // right here we are activating them making them real .... so everytime we object song appers this all will come with
	init(initTitle: String, initArtist: String, initType: String, initFile: String, initGenre: String! = "") {
        
        //Damn self
		self.title = initTitle
		self.artist = initArtist
		self.mediaType = initType
		self.fileName = initFile
		self.genre = initGenre
	}
	
}
