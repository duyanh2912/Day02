//
//  CustomRectView.swift
//  Day02
//
//  Created by Duy Anh on 12/26/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

public class CustomRectView: CustomDrawView {
    @IBInspectable public var firstEdge: CGFloat = 200
    @IBInspectable public var secondEdge: CGFloat = 100
    
    public override func draw(_ rect: CGRect) {
        scale = (scale < 0) ? 0 : scale
        scale = (scale > 1) ? 1 : scale
        
        let a = firstEdge * scale
        let b = secondEdge * scale
        
        let center = rect.center()
        
        let firstPoint = center.add(x: -a / 2, y: -b / 2)
        let secondPoint = firstPoint.add(x: a, y: 0)
        let thirdPoint = secondPoint.add(x: 0, y: b)
        let fourthPoint = thirdPoint.add(x: -a, y: 0)
        
        let rect = UIBezierPath()
        rect.move(to: firstPoint)
        rect.addLine(to: secondPoint)
        rect.addLine(to: thirdPoint)
        rect.addLine(to: fourthPoint)
        rect.close()
        
        UIColor.black.setStroke()
        rect.lineWidth = 1
        rect.stroke()
    }
}
