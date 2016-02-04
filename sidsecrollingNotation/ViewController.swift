//
//  ViewController.swift
//  sidsecrollingNotation
//
//  Created by brendan woods on 2016-02-03.
//  Copyright © 2016 brendan woods. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blankStaff:UIImageView?
    @IBOutlet weak var noteSprite:UIImageView?
    @IBOutlet weak var startButton:UIButton?
    @IBOutlet weak var stopButton:UIButton?
    
    var scrollingInterval = 0.02
    var timer = NSTimer()
    var filteredNotesArr = [(noteName: String,octaveNumber: Int,
        absoluteNote: Int, isFlatOrSharp:Bool,yPosition:Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setup() {
        let noteLibrary = NoteLibrary()
        noteLibrary.fillNoteLibrary()
        noteLibrary.filterNotesForDifficulty("easyTreble")
        filteredNotesArr = noteLibrary.returnNotesArray()
    }
    
    @IBAction func startNoteMovement() {
        timer.invalidate()
        noteSprite!.center.y = 136 //blankStaff!.frame.size.height - 207
        noteSprite!.center.x = self.view.frame.size.width + noteSprite!.frame.size.width
        timer = NSTimer.scheduledTimerWithTimeInterval(scrollingInterval, target: self, selector: Selector("moveSpriteLeft"), userInfo: nil, repeats: true)
        
    }

    @IBAction func stopNoteMovement() {
        timer.invalidate()
    }
    
    func moveSpriteLeft() {
        noteSprite!.center.x -= 1
        if noteSprite?.center.x == 0 {
            timer.invalidate()
        }
    }
    
    func pickRandomNote() -> Int {
        let maxRandom = filteredNotesArr.count
        let noteInt = Int(arc4random_uniform(UInt32(maxRandom)) + 1)
        return noteInt
    }
}

