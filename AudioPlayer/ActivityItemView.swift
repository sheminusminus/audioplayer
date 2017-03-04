//
//  ActivityItemView.swift
//  AudioPlayer
//
//  Created by Emily Kolar on 12/16/16.
//  Copyright © 2016 Emily Kolar. All rights reserved.
//

import UIKit

class ActivityItemView: UIView {
	
	
	// each item's uiview will need to have an associated activityitem (which is a record of the data associated with any user action we want to track and display).
	// this will provide any necessary text, image file name, etc that this uiview will need to show
	
	//=============================
	// MARK: properties
	//=============================
	
	// ui objects
    // ARE WE GOING TO DRAG THESE OUT ON TO OUR STORYBOARD
	var songImage: UIImageView!
	var titleLabeL: UILabel!
	var artistLabel: UILabel!
	var image: UIImage!
	
    
    
	// get these from controller
    // WEW WILL GET THIS INFO FROM USER? AND WHAT THEY DO??
	var titleText: String?
	var artistText: String?
	var imagePath: String?
	
	//=============================
	// MARK: lifecycle functions
	//=============================
	
    
    
    // WOULD LIKE TO GO OVER THESE
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

}
