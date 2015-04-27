//
//  DetailViewController.swift
//  Quickie Notes
//
//  Created by Phil Parkinson on 12/01/2015.
//  Copyright (c) 2015 Young. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tView.text = allNotes[currentNote].note
        tView.becomeFirstResponder()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if tView.text == "" {
            allNotes.removeAtIndex(currentNote)
        } else {
            allNotes[currentNote].note = tView.text
        }
        Note.saveNotes()
        noteTable?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

