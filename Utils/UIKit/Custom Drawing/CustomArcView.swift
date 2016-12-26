//
//  CustomArcView.swift
//  Day02
//
//  Created by Duy Anh on 12/27/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

@IBDesignable
public class CustomArcView: CustomDrawView {
    @IBInspectable public var radius: CGFloat = 75
    @IBInspectable public var angleInDegree: CGFloat = 90
    
    public override func draw(_ rect: CGRect) {
        let center = rect.center()
        
        var scale = self.scale
        scale = (scale < 0) ? 0 : scale
        scale = (scale > 1) ? 1 : scale
        
        let r = self.radius * scale
        
        angleInDegree = (angleInDegree < 0) ? 0 : angleInDegree
        angleInDegree = (angleInDegree > 360) ? 360 : angleInDegree
        
        if angleInDegree == 0 { return }
        
        let angle = angleInDegree / 180 * CGFloat.pi
        
        let arc = UIBezierPath()
        
        if angle == 2 * CGFloat.pi {
            arc.move(to: center.add(x: 0, y: r))
        } else {
            arc.move(to: center)
        }
        
        arc.addArc(withCenter: center,
                   radius: r,
                   startAngle: -(CGFloat.pi / 2 - angle / 2),
                   endAngle: -(CGFloat.pi / 2 - angle / 2) - angle,
                   clockwise: false)
        arc.close()
        
        UIColor.black.setStroke()
        arc.lineWidth = 1
        arc.stroke()
        
    }
}
