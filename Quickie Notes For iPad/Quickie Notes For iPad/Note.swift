//
//  Note.swift
//  Quickie Notes
//
//  Created by Phil Parkinson on 12/01/2015.
//  Copyright (c) 2015 Young. All rights reserved.
//

import UIKit

var allNotes:[Note] = []
var currentNote:Int = -1
var noteTable:UITableView?

let kAllNotes:String = "NOTES"

class Note: NSObject {
    var date:String
    var note:String
    
    override init(){
        date = NSDate().description
        note = ""
    }
    
    func dictionary() -> NSDictionary {
        return ["note":note, "date":date]
    }
    
    // type method to save notes
    class func saveNotes(){
        var aDictionaries:[NSDictionary] = []
        for var i:Int = 0; i < allNotes.count; i++ {
            aDictionaries.append(allNotes[i].dictionary())
        }
        NSUserDefaults.standardUserDefaults().setObject(aDictionaries, forKey: kAllNotes)
    }
    
    // type method to load notes
    class func loadNotes(){
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var savedData:[NSDictionary]? = defaults.objectForKey(kAllNotes) as? [NSDictionary]
        if let data:[NSDictionary] = savedData {
            for var i = 0; i < data.count; i++ {
                var n:Note = Note()
                n.setValuesForKeysWithDictionary(data[i])
                allNotes.append(n)
            }
        }
    }
}