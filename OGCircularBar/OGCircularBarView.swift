//
//  OGCircularBar.swift
//  OGCircularBar
//
//  Created by Oskar Groth on 2017-02-19.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import Cocoa

public final class OGCircularBarView: NSView, Sequence {
    
    public var bars: [CircularBarLayer] = []
    public var circleBars: [CircularBarLayer] = []
    var center: CGPoint {
        get {
            return NSMakePoint(floor(bounds.width/2), floor(bounds.height/2))
        }
    }

    override public init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        wantsLayer = true
    }
    
    public func addBar(progress: CGFloat, radius: CGFloat, width: CGFloat, color: NSColor, animate: Bool) {
        let bar = CircularBarLayer(center: center, radius: radius, width: width, startAngle: 0, endAngle: 2*CGFloat.pi*progress, color: color)
        bars.append(bar)
        layer!.addSublayer(bar)
        bar.setProgress(progress, duration: 0.75)
    }
    
    public func addCircleBar(radius: CGFloat, width: CGFloat, color: NSColor) {
        let circleBar = CircularBarLayer(center: center, radius: radius, width: width, color: color)
        circleBar.progress = 1
        layer?.addSublayer(circleBar)
    }
    
    public subscript(index: Int) -> CircularBarLayer {
        return bars[index]
    }
    
    public func makeIterator() -> IndexingIterator<[CircularBarLayer]> {
        return bars.makeIterator()
    }
    
}

public struct CircularBar {
    public var width: CGFloat?
    public var color: NSColor?
    public var backgroundColor: NSColor?
    
    public init?(color: NSColor? = nil, backgroundColor: NSColor? = nil, width: CGFloat? = nil) {
        self.color = color
        self.backgroundColor = backgroundColor
        self.width = width
    }
    
    public init(color: NSColor, backgroundColor: NSColor? = nil, width: CGFloat) {
        self.color = color
        self.backgroundColor = backgroundColor
        self.width = width
    }
}

open class CircularBarLayer: CAShapeLayer, CALayerDelegate, CAAnimationDelegate {
    var completion: ((Void) -> Void)?
    
    open var progress: CGFloat? {
        get {
            return strokeEnd
        }
        set {
            strokeEnd = newValue ?? 0
        }
    }
    
    public init(center: CGPoint, radius: CGFloat, width: CGFloat, startAngle: CGFloat, endAngle: CGFloat, color: NSColor, cap: String ) {
        super.init()
        let bezier = NSBezierPath()
        bezier.appendArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        delegate = self as CALayerDelegate
        path = bezier.cgPath
        fillColor = NSColor.clear.cgColor
        strokeColor = color.cgColor
        lineWidth = width
        lineCap = cap
        strokeStart = 0
        strokeEnd = 0
    }
    
    public init(center: CGPoint, radius: CGFloat, width: CGFloat, startAngle: CGFloat, endAngle: CGFloat, color: NSColor) {
        super.init()
        let bezier = NSBezierPath()
        bezier.appendArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        print("Arc: \(startAngle), \(endAngle)")
        delegate = self as CALayerDelegate
        path = bezier.cgPath
        fillColor = NSColor.clear.cgColor
        strokeColor = color.cgColor
        lineWidth = width
        lineCap = kCALineCapButt
        strokeStart = 0
        strokeEnd = 0
    }
    
    public convenience init(center: CGPoint, radius: CGFloat, width: CGFloat, color: NSColor) {
        self.init(center: center, radius: radius, width: width, startAngle: 0, endAngle: 2*CGFloat.pi, color: color)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    open func setProgress(_ progress: CGFloat, duration: CGFloat, completion: ((Void) -> Void)? = nil) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = strokeEnd
        animation.toValue = progress
        animation.duration = CFTimeInterval(duration)
        animation.delegate = self as CAAnimationDelegate
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        strokeEnd = progress
        add(animation, forKey: "strokeEnd")
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            completion?()
        }
    }
}

