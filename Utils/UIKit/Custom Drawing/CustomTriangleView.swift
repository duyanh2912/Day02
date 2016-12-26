//
//  CustomTriangleView.swift
//  Day02
//
//  Created by Developer on 12/26/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

@IBDesignable
public class CustomTriangleView: CustomDrawView {
    @IBInspectable public var firstEdge: CGFloat = 150
    @IBInspectable public var secondEdge: CGFloat = 150
    @IBInspectable public var thirdEdge: CGFloat = 150
    
    override public func draw(_ rect: CGRect) {
        let center = rect.center()
        
        if scale < 0 { scale = 0 }
        if scale > 1 { scale = 1 }
        
        let a = firstEdge * scale
        let b = secondEdge * scale
        let c = thirdEdge * scale
        
        let m = sqrt(2 * (b*b + c*c) - a*a) / 2
        
        let firstAngle = acos((m*m + c*c - a*a / 4) / (2 * m * c))
        let secondAngle = acos((m*m + b*b - a*a / 4) / (2 * m * b))
        
        let pointA = center.add(x: 0, y: -m * 2 / 3)
        let pointB = pointA.add(x: -c * sin(firstAngle) , y: c * cos(firstAngle))
        let pointC = pointA.add(x: b * sin(secondAngle), y: b * cos(secondAngle))
        
        let triangePath = UIBezierPath()
        triangePath.move(to: pointA)
        triangePath.addLine(to: pointB)
        triangePath.addLine(to: pointC)
        triangePath.close()
        
        triangePath.lineWidth = 1
        UIColor.black.setStroke()
        triangePath.stroke()
    }
}
