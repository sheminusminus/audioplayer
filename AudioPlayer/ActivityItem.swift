//
//  ActivityItem.swift
//  AudioPlayer
//
//  Created by Emily Kolar on 12/16/16.
//  Copyright © 2016 Emily Kolar. All rights reserved.
//

import Foundation

class ActivityItem {
	
    
    // activty feeds usually have these vars assiocated with a feed 
    // title
    // description
	var title: String!
	var imageName: String!
	var description: String!
	
    
    // now everytime ActivityItem appears it will have to have these as well .... we will have to fill these in
	init(initTitle: String, initDescription: String) {
		self.title = initTitle
		self.description = initDescription
	}
	
	
	
}
