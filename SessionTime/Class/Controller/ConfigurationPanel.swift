//
//  ConfigationPanel.swift
//  SessionTime
//
//  Created by R_flava_Man on 2018/10/15.
//  Copyright © 2018 Holiday Bomb. All rights reserved.
//

import Cocoa

class ConfigurationPanel: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    // MARK: - configation action
    @objc func startSession(_ sender:Any?) {
        if let controller = NSApplication.shared.windows[1].contentViewController as? ClockPanel {
            controller.startSession()
        }
    }
    
    @objc func pauseSession(_ sender:Any?) {
        if let controller: ClockPanel = NSApplication.shared.windows[1].contentViewController as? ClockPanel {
            controller.pauseSession()
        }
    }
    
    @objc func endSession(_ sender:Any?) {
        if let controller: ClockPanel = NSApplication.shared.windows[1].contentViewController as? ClockPanel {
            controller.endSession()
        }
    }
}

extension ConfigurationPanel {
    // MARK: Storyboard instantiation
    static func freshController() -> ConfigurationPanel {
        //1.
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "ConfigurationPanel")
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? ConfigurationPanel else {
            fatalError("Why cant i find ConfigurationPanel? - Check Main.storyboard")
        }
        return viewcontroller
    }
}
