//
//  ViewController.swift
//  OGCircularBar-Demo
//
//  Created by Oskar Groth on 2017-04-17.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var barView: OGCircularBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pink = NSColor(calibratedRed: 1, green: 0.059, blue: 0.575, alpha: 1)
        let blue = NSColor(calibratedRed: 20/255, green: 160/255, blue: 255, alpha: 1)
        let green = NSColor(calibratedRed: 0.321, green: 0.95, blue: 0.2, alpha: 1)
        
        barView.addCircleBar(radius: 100, width: 10, color: pink.withAlphaComponent(0.1))
        barView.addCircleBar(radius: 120, width: 15, color: blue.withAlphaComponent(0.1))
        barView.addCircleBar(radius: 80, width: 10, color: green.withAlphaComponent(0.1))
        barView.addBar(progress: 0.80, radius: 100, width: 10, color: pink, animate: true, duration: 1.5, glowOpacity: 0.4, glowRadius: 8)
        barView.addBar(progress: 0.45, radius: 120, width: 15, color: blue, animate: true, duration: 1.5, glowOpacity: 0.4, glowRadius: 8)
        barView.addBar(progress: 0.65, radius: 80, width: 10, color: green, animate: true, duration: 1.5, glowOpacity: 0.4, glowRadius: 8)
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

