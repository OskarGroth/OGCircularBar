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
        let color = NSColor(calibratedRed: 20/255, green: 160/255, blue: 255, alpha: 1)
        if !setup {
            barView.addCircleBar(radius: 100, width: 10, color: NSColor.purple.withAlphaComponent(0.2))
            barView.addBar(progress: 0.75, radius: 100, width: 10, color: NSColor.red, animate: true, glow: true)
            barView.addBar(progress: 0.45, radius: 120, width: 15, color: NSColor.blue, animate: true, glow: true)

            setup = true
        }

    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

