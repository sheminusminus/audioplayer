//
//  ActivityViewController.swift
//  AudioPlayer
//
//  Created by Emily Kolar on 12/16/16.
//  Copyright © 2016 Emily Kolar. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	// we have an activity array stored in ActivityManager.mgr.savedActivities
	
	// parts to savedActivities array items (create labels, image for these):
	// - title
	// - description
	// - imagePath
	
	@IBOutlet weak var collectionView: UICollectionView!
	

    override func viewDidLoad() {
        super.viewDidLoad()
		collectionView.delegate = self
		collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	// this is saying that there is gonna be as many cells as their is section headers or however many songs in the collection view
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		// count how many activities we have to display
		return ActivityManager.mgr.savedActivities.count
		
	}
	
	
	
	// creating the cell
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
		
		// using indexPath:
		
		// get the title for current activity
		let title = ActivityManager.mgr.savedActivities[indexPath.row].title
		// get desc. for current activity
		let description = ActivityManager.mgr.savedActivities[indexPath.row].description
		// get an image filepath for it
		let image = ActivityManager.mgr.savedActivities[indexPath.row].imagePath
		
		// make ui objects to display each
		
		//spot for image
		let artworkImage = UIImage(contentsOfFile: String(describing: image))
		
		// uiimage thru code
		let artworkView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 1000))
		artworkView.backgroundColor = UIColor.cyan
		let titleLabel = UILabel(frame: CGRect(x: 0, y: 100, width: cell.frame.width, height: 20))
		let descriptionLabel = UILabel(frame: CGRect(x: 0, y: 100, width: cell.frame.width, height: 20))
		
		
		
		titleLabel.text = title
		descriptionLabel.text = description
		artworkView.image = artworkImage
		
		// attach them the the cell
		cell.addSubview(artworkView)
		cell.addSubview(titleLabel)
		cell.addSubview(descriptionLabel)
		
		// return the cell
		return cell
	}
	
	
	// this will make the edit song pop up when we click the cell
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("clicked item at \(indexPath)")

	}
	
}
