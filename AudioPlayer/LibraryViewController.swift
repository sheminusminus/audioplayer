//
//  LibraryViewController.swift
//  AudioPlayer
//
//  Created by Emily Kolar, Alex Flores on 12/16/16.
//  Copyright © 2016 Emily Kolar, Alex Flores. All rights reserved.
//

import UIKit

// now we can talk the same language
class LibraryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // reference to the reference outlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // walking around now representing these powers and stuff
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
    

    // this is saying that there is gonna be as many cells as their is section headers or however many songs in the collection view
     func numberOfSections(in collectionView: UICollectionView) -> Int {
     
        // returing info
        return LibraryManager.mgr.sectionHeaders.count
    }
    
    
    
    // songs that will either be in "A B C D E F G H I J K L M N section"
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        let currentSection = LibraryManager.mgr.sectionHeaders[section]
        
        return LibraryManager.mgr.library[currentSection]!.count
        
        
    }
    
    
    
    // creating the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "libraryCell", for: indexPath) as! LibraryCell
        let currentSection = LibraryManager.mgr.sectionHeaders[indexPath.section]
        let currentSong = LibraryManager.mgr.library[currentSection]![indexPath.row]
        
        
        // text to display
        let titleText = currentSong.title
        let artistText = currentSong.artist
        
        //spot for image0
        let artworkImage = UIImage(data: currentSong.artworkImage)
		
		cell.artistLabel.text = artistText
		cell.titleLabel.text = titleText
		cell.imageView.image = artworkImage
        
        // uiimage thru code
//        let artworkView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 1000))
//        artworkView.backgroundColor = UIColor.cyan
//        let titleLabel = UILabel(frame: CGRect(x: 0, y: 100, width: cell.frame.width, height: 20))
//        let artistLabel = UILabel(frame: CGRect(x: 0, y: 100, width: cell.frame.width, height: 20))
		
        
        
//        titleLabel.text = titleText
//        artistLabel.text = artistText
//        artworkView.image = artworkImage
		
        cell.clipsToBounds = true
        
//        cell.addSubview(artworkView)
//        cell.addSubview(titleLabel)
//        cell.addSubview(artistLabel)
		
        return cell
    }
    
    
    // this will mkae the edit song pop up when we click the cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		let sectionHeader = LibraryManager.mgr.sectionHeaders[indexPath.section]
		let currentSong = LibraryManager.mgr.library[sectionHeader]![indexPath.row]
		
		
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let playScreen = storyboard.instantiateViewController(withIdentifier: "EditSong") as! EditSongViewController
		
		playScreen.presenter = self
		playScreen.songTitle = currentSong.title!
		playScreen.songArtist = currentSong.artist!
		
		if let image = UIImage(data: currentSong.artwork!) {
			playScreen.image = image
		}
		else {
			playScreen.image = UIImage()
		}
		
		playScreen.song = currentSong
		
        present(playScreen, animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selection = info[UIImagePickerControllerOriginalImage] as! UIImage
        let newView = UIImageView()
        newView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            self.view.addSubview(newView)
            newView.image = selection
        dismiss(animated: true, completion: nil)
    }
    
    
}

// layout options stack
extension LibraryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: self.view.frame.width / 2, height: 150)
        return cellSize
    }
    
}
