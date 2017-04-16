//
//  ViewController.swift
//  OGCircularBar
//
//  Created by Oskar Groth on 2017-04-12.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var backBarView: OGCircularBarView!
    @IBOutlet var barView: OGCircularBarView!
    var setup: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if !setup {
            let pink = NSColor(calibratedRed: 1, green: 0.059, blue: 0.575, alpha: 1)
            let blue = NSColor(calibratedRed: 20/255, green: 160/255, blue: 255, alpha: 1)
            let green = NSColor(calibratedRed: 0.321, green: 0.95, blue: 0.2, alpha: 1)

            barView.addCircleBar(radius: 100, width: 10, color: pink.withAlphaComponent(0.1))
            barView.addCircleBar(radius: 120, width: 15, color: blue.withAlphaComponent(0.1))
            barView.addCircleBar(radius: 80, width: 10, color: green.withAlphaComponent(0.1))
            barView.addBar(progress: 0.80, radius: 100, width: 10, color: pink, animate: true, glow: true)
            barView.addBar(progress: 0.45, radius: 120, width: 15, color: blue, animate: true, glow: true)
            barView.addBar(progress: 0.65, radius: 80, width: 10, color: green, animate: true, glow: true)

            setup = true
        }

    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

