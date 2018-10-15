//
//  ClockPanel.swift
//  SessionTime
//
//  Created by R_flava_Man on 2018/8/9.
//  Copyright © 2018年 Holiday Bomb. All rights reserved.
//

import Cocoa

class ClockPanel: NSViewController {

    @IBOutlet weak var displayTextField: NSTextField!
    
    let kCGFloatingWindowLevel: CGWindowLevel = CGWindowLevelForKey(CGWindowLevelKey.floatingWindow)
    
    var time: Int = 90*60
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.layer?.cornerRadius = 10.0
        view.layer?.borderWidth = 1
        view.layer?.borderColor = NSColor(white: 0, alpha: 0.1).cgColor
        view.layer?.backgroundColor = NSColor(white: 1, alpha: 1).cgColor
        
        updateDisplayLabel(time)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func viewWillAppear() {
        super.viewWillAppear()
        
        if let window1 = self.view.window {
            window1.level = NSWindow.Level(Int(kCGFloatingWindowLevel))
            window1.isOpaque = false
            window1.backgroundColor = NSColor.clear
        }
    }
    
    @objc func updateDisplayLabelRepeat() {
        time = time - 1
        updateDisplayLabel(time)
    }
    
    func updateDisplayLabel(_ time: Int) {
        let a = time/600
        let b = (time/60)%10
        let c = (time%60)/10
        let d = (time%60)%10
        displayTextField.stringValue = "\(a)\(b):\(c)\(d)"
    }
    
    func startSession() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateDisplayLabelRepeat), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .commonModes)
    }
    
    func pauseSession() {
        timer?.invalidate()
    }
    
    func endSession() {
        timer?.invalidate()
        time = 90*60
        updateDisplayLabel(time)
    }
}

