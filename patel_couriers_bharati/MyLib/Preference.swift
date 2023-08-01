//
//  Preference.swift
//  DrawableExample
//
//  Created by Alap Soni on 03/10/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

struct Pref{
    
   static func setPref(key: String,value: Any){
        let preferences = UserDefaults.standard
        preferences.set(value, forKey: key)
        preferences.synchronize()
    }
    
   static func clearAllPref() -> Void {
        //for clear userdefaults
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print("Shared Preferences -- \(Array(UserDefaults.standard.dictionaryRepresentation().keys))")
    }
    
   static func getPref(key: String) -> Any {
        let preferences = UserDefaults.standard
        return preferences.string(forKey: key)
    }
    
}
