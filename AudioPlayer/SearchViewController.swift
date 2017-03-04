//
//  SearchViewController.swift
//  AudioPlayer
//
//  Created by Emily Kolar, Alex Flores on 12/16/16.
//  Copyright © 2016 Emily Kolar, Alex Flores. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
                            // now we can talk all of their languages !!!!!! * * * * * * * * * * * * * * * * *
                                                        // Delegate and DataSource???????? whats the difference ????????????????????????????????
class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate {
	
    

    
	
    // reference to UI OBJECT
    // "HOW ELSE ARE WE SUPPOSE TO TALK ABOUT THEM"
    // used in the viewDidLoad
	@IBOutlet weak var tableView: UITableView!
    

	
    
    // THIS VAR WILL NOW WALK AROUND BEING THE TYOE AVAUDIPLAYER
    // why cant we say var player = avauidoplayer!
    var player: AVAudioPlayer!
	
  
    
    
    
    
    
	// LIFECYCLE FUNCTIONS
    // RIGHT BEFORE THE VIEW COMES ON SCREEN HAVE THIS READY??
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
        
		//buildSongLibrary()
	}
	// LIFECYCLE FUNCTIONS
    // WHEN THE View LOADS!!!!!
    override func viewDidLoad() {
        super.viewDidLoad()
          // I HATE SELF...... NO CLUE
		tableView.delegate = self
		tableView.dataSource = self
    }
    // LIFECYCLE
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
    
    
    
    
    
    
    
                                        // ** PROTOCOL METHODS OF UITableViewDataSource **
    

    // THIS FUNCTION TAKES A UITableView AND IndexPath....     NO RETURN !!!!!!!!!
    // THIS HAS TO DO WITH PRESSING THE SONG AND GOING TO THE PLAYSCREEN AND PLAYING THE PLAYING THE SONG
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedSection = LibraryManager.mgr.sectionHeaders[indexPath.section]
        let selectedSong = LibraryManager.mgr.library[selectedSection]?[indexPath.row]
		
		
        // this functions is ready to happen when the
		popupPlayer(song: selectedSong!)
		

	}
	
    
    
    
    
    
	// THIS FUNCTION JUST TAKES AND TableView AND RETURNS -> NUMBER OF SECTIONS
    // where does it return it in the simulator??
	func numberOfSections(in tableView: UITableView) -> Int {
        // JUST COUNTS sectionsHeaders
		return LibraryManager.mgr.sectionHeaders.count
	}
	
    
    
    
    
    
    
    
    // THIS FUNCTION RETURNS THE TITLE OF THE HEADER????
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return LibraryManager.mgr.sectionHeaders[section]
	}
	
    
    
    
    
    
    
    // THIS FUNCTION IS GONNA RETURN THE NUMBER OF ROWS
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// this is a temporary return; it will be different later
		return 1
	}
	
    
    
    
    
    
    
    
    
    // ????
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		
	}
    
    
    
    
    
    
    
    
    
    
    // this will create a single cell? becuase it returns UITableViewCell??
    // we get this from WHAT???
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = UITableViewCell(style: .default, reuseIdentifier: "songCell")
		
		// NOTE: we'll use these variables to help define the tablecell's content, but they won't work yet:
		
		let sectionHeader = LibraryManager.mgr.sectionHeaders[indexPath.section]
        let sectionSongs = LibraryManager.mgr.library[sectionHeader]
		let currentSong = sectionSongs?[indexPath.row]
		let songLabel = UILabel(frame: CGRect(x: cell.frame.minX, y: cell.frame.minY, width: cell.frame.width, height: cell.frame.height))
        
        // IF what????????
		if currentSong != nil {
            
            // set the songLabel text
            // whats with -
            // HOW ARE WE ABLE TO ACCESS THE artist and title objects from the Song.swift
			songLabel.text = "\(currentSong!.artist!) - \(currentSong!.title!)"
		}
        
        // ADDING THE songLabel WE MADE FROM CODE
		cell.addSubview(songLabel)
       
		
		// NOTE: this function returns a tablecell, but this cell is currently blank
		return cell
	}
	
    
    
    
    
    
    
    
    
    
	// this creates the tiny alphabetized list on the right side of screen
	func sectionIndexTitles(for tableView: UITableView) -> [String]? {
		return LibraryManager.mgr.sectionHeaders
	}
    
    
    
	
	func popupPlayer(song: Song) {

		AudioManager.mgr.popupPlayer(senderVC: self, newSong: song)
	}
	
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
