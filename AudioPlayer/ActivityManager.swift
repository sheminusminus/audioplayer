//
//  ActivityManager.swift
//  AudioPlayer
//
//  Created by Emily Kolar on 2/1/17.
//  Copyright © 2017 Emily Kolar. All rights reserved.
//

import Foundation

enum HistoryAction: Int {
	case title = 0, artist, artwork
}

class ActivityManager {
	
	static let mgr = ActivityManager()
	
	private var _historyItems: [ActivityItem]!
	private var _historySong: Song!
	
	private init() {
		self._historyItems = []
	}
	
	private func _setHistoryTitle(song: Song) -> ActivityItem {
		let item = ActivityItem(initTitle: "Title", initDescription: titleMessage, initPath: song.fileName)
		return item
	}
	
	private func _setHistoryArtist(song: Song) -> ActivityItem {
		let item = ActivityItem(initTitle: "Artist", initDescription: artistMessage, initPath: song.fileName)
		return item
	}
	
	private func _setHistoryArtwork(song: Song) -> ActivityItem {
		let item = ActivityItem(initTitle: "Artwork", initDescription: artworkMessage, initPath: song.fileName)
		return item
	}
	
	func addHistoryItem(song: Song, actionType: HistoryAction) {
		var activityItem: ActivityItem!
		_historySong = song
		switch(actionType) {
			case .title:
				activityItem = _setHistoryTitle(song: song)
			case .artist:
				activityItem = _setHistoryArtist(song: song)
			case .artwork:
				activityItem = _setHistoryArtwork(song: song)
		}
		_historyItems.append(activityItem)
	}
	
	var titleMessage: String {
		get {
			return "You edited this: \(_historySong.title!)"
		}
	}
	
	var artistMessage: String {
		get {
			return "You edited this: \(_historySong.artist!)"
		}
	}
	
	var artworkMessage: String {
		get {
			return "You edited artwork: \(_historySong.title!)"
		}
	}
	
	var savedActivities: [ActivityItem] {
		get {
			return _historyItems
		}
	}
	
}
