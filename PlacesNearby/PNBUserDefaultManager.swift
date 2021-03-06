//
//  PNBUserDefaultManager.swift
//  PlacesNearby
//
//  Created by Abhishek on 07/11/16.
//  Copyright © 2016 Abhishek. All rights reserved.
//

import Foundation

class PNBUserDefaultManager{
	static let sharedUserDefault = PNBUserDefaultManager()

	enum KeysForUserDefault:String {
		case radiusOfSearch = "radiusOfSearch"
		case defaultUI = "defaultUI"
		case nextPageToken = "nextPageToken"
		case searchHisory = "searchHisory"
		case sortBy = "sortBy"
		case mapType = "mapType"
	}
	final func getValueObject(key:KeysForUserDefault) -> AnyObject?{
		if let value = UserDefaults.standard.value(forKey: key.rawValue) {
			return value as AnyObject?
		}
		//default values
		switch key{
		case .radiusOfSearch:
			return Int(3) as AnyObject?

		case .defaultUI:
			return PNBListOfResultViewController.currentUIState.list.rawValue as AnyObject?

		case .nextPageToken:
			return nil

		case .searchHisory:
			return [String]() as AnyObject?

		case .sortBy:
			return SortingMethod.releavence.rawValue as AnyObject?

		case .mapType:
			return MapType.standard.rawValue as AnyObject?
		}

	}

	final func setValueForObject(value:AnyObject?, forKey:KeysForUserDefault) {
		UserDefaults.standard.set(value, forKey: forKey.rawValue)
	}
}
