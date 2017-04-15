//
//  ViewController.swift
//  OGCircularBar
//
//  Created by Oskar Groth on 2017-04-12.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var barView: OGCircularBarView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        barView.addCircleBar(radius: 100, width: 10, color: NSColor.purple.withAlphaComponent(0.2))
        
        barView.addBar(progress: 0.99, radius: 100, width: 10, color: NSColor.purple, animate: true)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

