//
//  LibraryViewController.swift
//  AudioPlayer
//
//  Created by Emily Kolar on 12/16/16.
//  Copyright © 2016 Emily Kolar. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
		imagePicker.delegate = self
		collectionView.delegate = self
		collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		print(LibraryManager.mgr.sectionHeaders.count)
		return LibraryManager.mgr.sectionHeaders.count
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		let currentSection = LibraryManager.mgr.sectionHeaders[section]
		return LibraryManager.mgr.library[currentSection]!.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "libraryCell", for: indexPath)
		
		let currentSection = LibraryManager.mgr.sectionHeaders[indexPath.section]
		let currentSong = LibraryManager.mgr.library[currentSection]![indexPath.row]
		
		print(currentSong.title)
		
		// text to display
		let titleText = currentSong.title
		let artistText = currentSong.artist
	
		// spot for the image
		let artworkImage = UIImage(data: currentSong.artworkImage)
		
		// ui objects
		let artworkView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
		artworkView.backgroundColor = UIColor.cyan
		let titleLabel = UILabel(frame: CGRect(x: 0, y: 100, width: cell.frame.width, height: 20))
		let artistLabel = UILabel(frame: CGRect(x: 0, y: 120, width: cell.frame.width, height: 20))
		
		titleLabel.text = titleText
		artistLabel.text = artistText
		artworkView.image = artworkImage
		
		cell.addSubview(artworkView)
		cell.addSubview(titleLabel)
		cell.addSubview(artistLabel)
		
		cell.backgroundColor = UIColor.magenta
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		// code here
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		let selection = info[UIImagePickerControllerOriginalImage] as! UIImage
		let newView = UIImageView()
		newView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
		self.view.addSubview(newView)
		newView.image = selection
		dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}

	@IBAction func pickImage(_ sender: Any) {
		imagePicker.allowsEditing = false
		imagePicker.sourceType = .photoLibrary
		present(imagePicker, animated: true, completion: nil)
	}
	
 
}

extension LibraryViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cellSize = CGSize(width: 120, height: 150)
		print(cellSize)
		return cellSize
	}
	
}
