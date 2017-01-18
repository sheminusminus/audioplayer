//
//  SearchViewController.swift
//  AudioPlayer
//
//  Created by Emily Kolar on 12/16/16.
//  Copyright © 2016 Emily Kolar. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
                            // now we can talk all of their languages !!!!!! * * * * * * * * * * * * * * * * *
                                                        // Delegate and DataSource???????? whats the difference ????????????????????????????????
class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate {
	
    
                                                    // WHY ARE THERE 4 DIFFERENT "tableView" functions with the protocol methods?????
    
    
	
    // reference to UI OBJECT
    // "HOW ELSE ARE WE SUPPOSE TO TALK ABOUT THEM"
    // used in the viewDidLoad
	@IBOutlet weak var tableView: UITableView!
    
    
    
    
    // THIS VAR WILL NOW WALK AROUND BEING THE TYOE AVAUDIPLAYER
    // why cant we say var player = avauidoplayer!
    var player: AVAudioPlayer!
    
    
    
    
	
	// a variable to hold the library of songs
    // whats with the type here???
    // library is now gonna walk around a represent a letter with multiple songs from the letter
	var library: [String: [Song]] = [String:[Song]]()
	// library = ["A": ["A song 1", "A song 2"], "B": ["B song 1", "B song 2"]]
	
    
    
    
    
	// a constant to hold titles of various library sections; labels each section with letter
    // section headers is a constant that is of type string of arraays?? holds the section letters
	let sectionHeaders: [String] = ["#", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

	
    
    
    

	// LIFECYCLE FUNCTIONS
    // RIGHT BEFORE THE VIEW COMES ON SCREEN HAVE THIS READY??
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
        //
		buildSongLibrary()
	}
    
    
    
	// LIFECYCLE FUNCTIONS
    // WHEN THE View LOADS!!!!!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        // these constants are gonna walk around this sheet and represent the song objects that include the Title,Type,Artist etc.............
		let arcadeFire = Song(initTitle: "We Used to Wait", initArtist: "Arcade Fire", initType: "Rock", initFile: "ArcadeFire-WeUsedToWait.m4a")
		let brandNew = Song(initTitle: "Nobody Moves", initArtist: "Brand New", initType: "Rock", initFile: "BrandNew-NobodyMoves.mp3")
		let coconutRecords = Song(initTitle: "West Coast", initArtist: "Coconut Records", initType: "Pop Rock", initFile: "CoconutRecords-WestCoast.m4a")
        
        
        
        
        
		// gonna loop through the sectionHeaders and Letter is just an index essentially ????? you just made it there right ??
		for letter in sectionHeaders {
            
            
            // WHATS HAPPENING HERE ????
			library[letter] = [Song]()
            
            
            
            // START OF THE IF .... GET THE BALL ROLLING
            // IF LETTET WHICH WE MADE AT THE START OF THE LOOP IS EQUAL TO "A" THEN DO THIS??????
			if letter == "A" {
                
                // // ADD arcadeFire TO THE LIBRARY LETTER "A"
                // WHAT IS THE [Letter]? DOING HERE ...?????
				library[letter]?.append(arcadeFire)
            }
                
                // IF LETTER IS "B" DO THIS ....
			else if letter == "B" {
                
                // ADD brandNew TO LIBRARY LETTER "B"
				library[letter]?.append(brandNew)
			}
                
                // IF LETTER IS EQUAL TO "C" DO THIS ....
			else if letter == "C" {
                
                // ADD coconutRecords TO LIBRARY LETTER "C"
				library[letter]?.append(coconutRecords)
			}
                
                // IF NONE OF THOSE ABOVE DO THIS ...
			else {
                
                //ADD brandNew TO THE REST OF THE LETTERS for now
				library[letter]?.append(brandNew)
			}
            
		}
        // END OF LOOP??? *****************
		
        
		print(library)
        
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
        
        let selectedSection = sectionHeaders[indexPath.section]
        let selectedSong = library[selectedSection]?[indexPath.row]
        let songName = selectedSong!.fileName!
        let fullPath = URL(fileURLWithPath: "\(Bundle.main.resourcePath!)/\(songName)")
        
        // TO HAVE PlayScreen pop up
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let PlayScreen = storyboard.instantiateViewController(withIdentifier: "PlayScreen") as! PlayerViewController
        
        print(fullPath)
        
        // FORGOT WHAT DO DOES
        do{
            
            player = try! AVAudioPlayer(contentsOf: fullPath)
            player.delegate = self
            player.play()
            
            // will present the PlayScreen
            self.present(PlayScreen, animated: true, completion: nil)
            
        }
        catch{
            print("error")
            
        }
    }
    
    
    
    
    
    
    
    
    
	// THIS FUNCTION JUST TAKES AND TableView AND RETURNS -> NUMBER OF SECTIONS
    // where does it return it in the simulator??
	func numberOfSections(in tableView: UITableView) -> Int {
        // JUST COUNTS sectionsHeaders
		return sectionHeaders.count
	}
	
    
    
    
    
    
    
    
    // THIS FUNCTION RETURNS THE TITLE OF THE HEADER????
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sectionHeaders[section]
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
		
		let sectionHeader = sectionHeaders[indexPath.section]
		let sectionSongs = library[sectionHeader]
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
		return sectionHeaders
	}
    
    
    
    
    
    
    
    
	
	// MARK: functions, actions
    // DIFFERENT FROM THE PROTOCOL METHODS ABOVE??
    // ITS ACUALLY GONNA BUILD THE THING WE SEE WHEN WE RUN OUR SIMULATOR?????????????????????
	func buildSongLibrary() {
        
        
		let m4aPaths = Bundle.main.paths(forResourcesOfType: ".m4a", inDirectory: "")
		var allPaths = Bundle.main.paths(forResourcesOfType: ".mp3", inDirectory: "")
		
		allPaths.append(contentsOf: m4aPaths);
        
		
        // LOOP
        // WHY IS THERE PATH HERE TO?????
        // YOU CAN HAVE A LOOP WITH ALL LETS/VARS???? OR IS THIS FOR OUR OWN SAKE TO MAKE SURE ITS WORKING?? CUS OF THE print()
        //
		for path in allPaths {
			let pathComponents = path.characters.split(separator: "-")
			print(pathComponents)
            
			let nameComponent = pathComponents.last
			print(nameComponent)
            
			let remainingComponents = pathComponents[pathComponents.count - 2].split(separator: "/")
			let artistComponent = remainingComponents[remainingComponents.count - 1]
			print(artistComponent)
		}
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
