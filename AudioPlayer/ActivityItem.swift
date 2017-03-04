//
//  ActivityItem.swift
//  AudioPlayer
//
//  Created by Emily Kolar, Alex Flores on 12/16/16.
//  Copyright © 2016 Emily Kolar, Alex Flores. All rights reserved.
//

import Foundation

class ActivityItem {
	
    
    // activty feeds usually have these vars assiocated with a feed 
    // title
    // description
	var title: String!
	var imagePath: URL!
	var description: String!
	
    
    // now everytime ActivityItem appears it will have to have these as well .... we will have to fill these in
	init(initTitle: String, initDescription: String, initPath: URL) {
		self.title = initTitle
		self.description = initDescription
		self.imagePath = initPath
	}
	
	
	
}
