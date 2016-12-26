//
//  DrawView.swift
//  Day02
//
//  Created by Developer on 12/25/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

@IBDesignable
public class DrawTriangleView: UIView {
    @IBInspectable public var lineWidth: CGFloat = 1
    @IBInspectable public var strokeColor: UIColor = .black
    @IBInspectable public var fillColor: UIColor = .white
    
    override public func draw(_ rect: CGRect) {
        // height over width ratio
        let ratio: CGFloat = sqrt(3) / 3 * 2
        
        let a: CGFloat
        if height / width < ratio {
            a = (height - 2 * lineWidth * height / 1000) / ratio
        } else {
            a = width - 2 * lineWidth * height / 1000
        }
        
        let center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        
        let first = center.add(x: 0, y: -a * sqrt(3) / 3)
        let second = first.add(x: -a / 2, y: a * sqrt(3) / 2)
        let third = second.add(x: a, y: 0)
        
        let linePath = UIBezierPath()
        linePath.move(to: first)
        linePath.addLine(to: second)
        linePath.addLine(to: third)
        linePath.close()
        
        strokeColor.setStroke()
        linePath.lineWidth = lineWidth * height / 1000
        linePath.stroke()
        
        fillColor.setFill()
        linePath.fill()
 
    }
}
