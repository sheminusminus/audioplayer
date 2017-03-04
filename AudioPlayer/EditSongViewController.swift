//
//  EditSongViewController.swift
//  AudioPlayer
//
//  Created by Logan Caracci on 1/24/17.
//  Copyright © 2017 Emily Kolar. All rights reserved.
//

import UIKit


/// so like if i wanted to use the audioManager for 
class EditSongViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

	@IBOutlet weak var titleField: UITextField!
	@IBOutlet weak var artistField: UITextField!
	@IBOutlet weak var artworkView: UIImageView!
	
	// walking around now representing these powers and stuff
	let imagePicker = UIImagePickerController()
	
	var songTitle: String = ""
	var songArtist: String = ""
	var image: UIImage!
	
	var song: Song!
	
	var actions: [HistoryAction]!
	
	var presenter: LibraryViewController!
    
    func closeEditSong() {
		presenter.collectionView.reloadData()
		self.dismiss(animated: true, completion: nil)
    }
	
    override func viewDidLoad() {
        super.viewDidLoad()
		actions = []
		imagePicker.delegate = self
		titleField.delegate = self
		artistField.delegate = self
		titleField.text = songTitle
		artistField.text = songArtist
		artworkView.image = image
		let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
		self.view.addGestureRecognizer(tap)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	func hideKeyboard(recognizer: UITapGestureRecognizer) {
		if titleField.isEditing || artistField.isEditing {
			self.view.endEditing(true)
		}
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
	
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.view.endEditing(true)
		return true
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		if textField == titleField {
			actions.append(HistoryAction.title)
		}
		else if textField == artistField {
			actions.append(HistoryAction.artist)
		}
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		let selection = info[UIImagePickerControllerOriginalImage] as! UIImage
		artworkView.image = selection
		LibraryManager.mgr.addArtwork(addToSong: song, image: selection)
		actions.append(HistoryAction.artwork)
		dismiss(animated: true, completion: nil)
	}
	
	func rememberActivity(song: Song) {
		
		// get a single action at a time
		for action in actions {
			// save the action with ActivityManager
			ActivityManager.mgr.addHistoryItem(song: song, actionType: action)
		}
		print(ActivityManager.mgr.savedActivities)
	}
	
	// MARK: actions
	
	@IBAction func done(_ sender: Any) {
		
		let editedSong = Song(initTitle: titleField.text!, initArtist: artistField.text!, initType: song.mediaType, initFile: song.fileName)
		
		rememberActivity(song: editedSong)
		
		LibraryManager.mgr.changeTitle(changeSong: editedSong, originalSong: song)
		LibraryManager.mgr.changeArtist(changeSong: editedSong, originalSong: song)
		
		closeEditSong()
	}

	@IBAction func changeArt(_ sender: Any) {
		present(imagePicker, animated: true, completion: nil)
	}
	

}
