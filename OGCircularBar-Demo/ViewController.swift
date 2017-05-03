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
        
        // Normal Backgrounds
        
        barView.addBar(progress: 1, radius: 100, width: 15, color: pink.withAlphaComponent(0.1), animationDuration: 0, glowOpacity: 0, glowRadius: 0, type: .full, clockwise: true, offset: nil
        )
        barView.addBar(progress: 1, radius: 120, width: 15, color: blue.withAlphaComponent(0.1), animationDuration: 0, glowOpacity: 0, glowRadius: 0, type: .full, clockwise: true, offset: nil)
        barView.addBar(progress: 1, radius: 80, width: 10, color: green.withAlphaComponent(0.1), animationDuration: 0, glowOpacity: 0, glowRadius: 0, type: .full, clockwise: true, offset: nil)
        
        // Normal Bars
        
        barView.addBar(progress: 0 , radius: 100, width: 15, color: pink, animationDuration: 0, glowOpacity: 0.4, glowRadius: 8, type: .full, clockwise: true, offset: nil)
        barView.addBar(progress: 0.45, radius: 120, width: 15, color: blue, animationDuration: 1.5, glowOpacity: 0.4, glowRadius: 8, type: .full, clockwise: true, offset: nil)
        barView.addBar(progress: 0.65, radius: 80, width: 10, color: green, animationDuration: 1.5, glowOpacity: 0.4, glowRadius: 8, type: .full, clockwise: true, offset: nil)
        
        // Half Bar Backgrounds
        
        barView.addBar(progress: 1, radius: 150, width: 15, color: NSColor.magenta.withAlphaComponent(0.1), animationDuration: 0, glowOpacity: 0, glowRadius: 0, type: .topHalf, clockwise: nil, offset: CGPoint(x: 0, y: -20))
        barView.addBar(progress: 1, radius: 150, width: 15, color: NSColor.cyan.withAlphaComponent(0.1), animationDuration: 0, glowOpacity: 0, glowRadius: 0, type: .bottomHalf, clockwise: true, offset: CGPoint(x: 0, y: 20))
        
        // Half Bars

        barView.addBar(progress: 0.50, radius: 150, width: 15, color: NSColor.magenta.withAlphaComponent(0.6), animationDuration: 1.5, glowOpacity: 0.4, glowRadius: 8, type: .topHalf, clockwise: true, offset: CGPoint(x: 0, y: -20))
        barView.addBar(progress: 0.50, radius: 150, width: 15, color: NSColor.cyan.withAlphaComponent(0.6), animationDuration: 1.5, glowOpacity: 0.4, glowRadius: 8, type: .bottomHalf, clockwise: true, offset: CGPoint(x: 0, y: 20))
        
    }
    
    @IBAction func sliderPress(_ sender: Any) {
        let val = CGFloat((sender as! NSSlider).floatValue/100)
        barView.bars[3].animateProgress(val, duration: 1.5)
        barView.bars.last?.animateProgress(val, duration: 1)
        barView.bars[barView.bars.count-2].animateProgress(val, duration: 1)
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

