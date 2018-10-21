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
    
    let popover = NSPopover()
    
    var eventMonitor: EventMonitor?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        if let button = statusItem.button {
            button.image = NSImage(named: NSImage.Name("logo"))
            button.action = #selector(togglePopover(_:))
        }
        
        // configuration panel
        popover.contentViewController = ConfigurationPanel.freshController()
        popover.animates = false
        
        // click outside panel auto close
        eventMonitor = EventMonitor(mask: [.leftMouseUp, .rightMouseDown], handler: { [weak self] event in
            if let strongSelf = self, strongSelf.popover.isShown {
                strongSelf.closePopover(event)
            }
        })
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func constructMenu() {
//        let menu = NSMenu()
//        menu.addItem(NSMenuItem(title: "开始会议", action: #selector(startSession(_:)), keyEquivalent: "S"))
//        menu.addItem(NSMenuItem(title: "暂停", action: #selector(pauseSession(_:)), keyEquivalent: "P"))
//        menu.addItem(NSMenuItem(title: "结束", action: #selector(endSession(_:)), keyEquivalent: "E"))
//        menu.addItem(NSMenuItem(title: "退出", action: #selector(endSession(_:)), keyEquivalent: "q"))
//        statusItem.menu = menu
    }
    
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
    
    func showPopover(_ sender: Any?) {
        eventMonitor?.start()
        
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(_ sender: Any?) {
        eventMonitor?.stop()
        
        popover.performClose(sender)
    }
}

