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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startNoteMovement() {
        noteSprite!.center.y = blankStaff!.frame.size.height - 195
        noteSprite!.center.x = blankStaff!.frame.size.width + noteSprite!.frame.size.width
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: Selector("moveSpriteLeft"), userInfo: nil, repeats: true)
        
    }

    func moveSpriteLeft() {
        noteSprite!.center.x -= 1
    }
    
}

