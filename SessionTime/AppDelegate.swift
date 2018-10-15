//
//  AppDelegate.swift
//  SessionTime
//
//  Created by R_flava_Man on 2018/8/9.
//  Copyright © 2018年 Holiday Bomb. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        if let button = statusItem.button {
            button.image = NSImage(named: NSImage.Name("logo"))
        }
        
        constructMenu()
    }
    
    

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func constructMenu() {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "开始会议", action: #selector(startSession(_:)), keyEquivalent: "S"))
        menu.addItem(NSMenuItem(title: "暂停", action: #selector(pauseSession(_:)), keyEquivalent: "P"))
        menu.addItem(NSMenuItem(title: "结束", action: #selector(endSession(_:)), keyEquivalent: "E"))
        menu.addItem(NSMenuItem(title: "退出", action: #selector(endSession(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
    }
    
    @objc func startSession(_ sender:Any?) {
        if let controller = NSApplication.shared.windows[1].contentViewController as? ViewController {
            controller.startSession()
        }
    }
    
    @objc func pauseSession(_ sender:Any?) {
        if let controller: ViewController = NSApplication.shared.windows[1].contentViewController as? ViewController {
            controller.pauseSession()
        }
    }
    
    @objc func endSession(_ sender:Any?) {
        if let controller: ViewController = NSApplication.shared.windows[1].contentViewController as? ViewController {
            controller.endSession()
        }
    }
    
    @objc func printQuote(_ sender:Any?) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        print("\(quoteText)=\(quoteAuthor)")
    }


}

