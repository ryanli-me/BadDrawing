//
//  DrawView.swift
//  BadDrawing
//
//  Created by Yihe Li on 1/21/15.
//  Copyright (c) 2015 self. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var lines: [Line] = []
    var lastPoint: CGPoint!
    var drawColor : UIColor
    
    required init(coder aDecoder: NSCoder) {
        drawColor = UIColor.blackColor()
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent  ) {
        lastPoint = touches.anyObject()?.locationInView(self)
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var newPoint = touches.anyObject()?.locationInView(self)
        lines.append(Line(start: lastPoint, end: newPoint!, color: drawColor))
        lastPoint = newPoint
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 5)
        CGContextSetLineCap(context, kCGLineCapRound)
        for line in lines {
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, line.startX, line.startY)
            CGContextAddLineToPoint(context, line.endX, line.endY)
            CGContextSetStrokeColorWithColor(context, line.color.CGColor)
            CGContextStrokePath(context)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext();
        let imageData = UIImagePNGRepresentation(image);
    }
}
