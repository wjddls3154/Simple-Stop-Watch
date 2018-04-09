//
//  ViewController.swift
//  Simple Stop Wsactch
//
//  Created by D7702_10 on 2018. 4. 9..
//  Copyright © 2018년 jik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var count = 0
    var myTimer = Timer()
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      stop.isEnabled = false
        
}

    @IBAction func btnStart(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
        start.isEnabled = false
        stop.isEnabled = true
    }
    
    @IBAction func btnStop(_ sender: Any) {
        myTimer.invalidate()
        start.isEnabled = true
        stop.isEnabled = false
    }
    
    @IBAction func btnReset(_ sender: Any) {
        count = 0
        timeLabel.text = "00:00:00"
    }
    
    
    func updateTime() {
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        timeLabel.text = String(format: "%02d:%02d:%02d",min,sec,msec)
}
}
