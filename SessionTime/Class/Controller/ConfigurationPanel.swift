//
//  ConfigationPanel.swift
//  SessionTime
//
//  Created by R_flava_Man on 2018/10/15.
//  Copyright © 2018 Holiday Bomb. All rights reserved.
//

import Cocoa

class ConfigurationPanel: NSViewController {
    
    @IBOutlet var slider: NSSlider?
    
    @IBOutlet var startButton: NSButton!
    @IBOutlet var resetButton: NSButton!
    @IBOutlet var quitButton: NSButton!
    @IBOutlet var switchButton: NSButton!
    
    @IBOutlet var leftPreviewButton: NSButton!
    @IBOutlet var rightPreviewButton: NSButton!
    
    @IBOutlet var scrollView: NSScrollView!
    @IBOutlet var displayTextField: NSTextField!
    @IBOutlet var displayView: NSView!
    
    var clockPanel: ClockPanel?
    
    lazy var progressLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        let width = displayView.bounds.size.width - 5*2
        let transform = CATransform3DMakeRotation(.pi, 1, 1, 0)
        
        shapeLayer.path = CGPath(roundedRect: CGRect(x: 5, y: 5, width:width , height: width), cornerWidth: width/2.0, cornerHeight: width/2.0, transform: nil)
        shapeLayer.strokeColor = NSColor.orange.cgColor
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = CGFloat((slider?.floatValue ?? 60.0)/90.0)
        shapeLayer.lineWidth = 5
        shapeLayer.lineCap = "round"
        shapeLayer.fillColor = NSColor.clear.cgColor
        shapeLayer.transform = transform
        return shapeLayer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        // get the clock panel
        if let panel = NSApplication.shared.windows[1].contentViewController as? ClockPanel {
            clockPanel = panel
        }
        
        customUI()
    }
    
    func customUI() {
        displayView.wantsLayer = true
        displayView.layer?.addSublayer(progressLayer)
    }
}

extension ConfigurationPanel {
    // MARK: - action
    @IBAction func startButtonAction(button: NSButton) {
        startSession(button)
    }
    
    @IBAction func resetButtonAction(button: NSButton) {
        
    }
    
    @IBAction func switchButtonAction(button: NSButton) {
        
    }
    
    @IBAction func quitButtonAction(button: NSButton) {
        
    }
    
    @IBAction func sliderUpdate(slider: NSSlider) {
        displayTextField.stringValue = "\(slider.integerValue):00"
        progressLayer.strokeEnd = CGFloat((slider.floatValue)/90.0)
    }
    
    @IBAction func leftPreviewAction(button: NSButton) {
        
    }
    
    @IBAction func rightPreviewAction(button: NSButton) {
        
    }
}

extension ConfigurationPanel {
    // MARK: - configation action
    @objc func startSession(_ sender:Any?) {
        clockPanel?.startSession()
    }
    
    @objc func pauseSession(_ sender:Any?) {
        clockPanel?.pauseSession()
    }
    
    @objc func endSession(_ sender:Any?) {
        clockPanel?.endSession()
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
