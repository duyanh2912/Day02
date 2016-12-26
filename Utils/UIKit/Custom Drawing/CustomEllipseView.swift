//
//  CustomEllipseView.swift
//  Day02
//
//  Created by Duy Anh on 12/27/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

@IBDesignable
public class CustomEllipseView: CustomDrawView {
    @IBInspectable public var firstRadius: CGFloat = 100
    @IBInspectable public var secondRadius: CGFloat = 50
    
    public override func draw(_ rect: CGRect) {
        let center = rect.center()
        
        var scale = self.scale
        scale = (scale < 0) ? 0 : scale
        scale = (scale > 1) ? 1 : scale
        
        let width = firstRadius * scale * 2
        let height = secondRadius * scale * 2
        
        let ellipse = UIBezierPath(ovalIn: CGRect(
            origin: center.add(x: -width / 2, y: -height / 2),
            size: CGSize(width: width, height: height)
        ))
        
        UIColor.black.setStroke()
        ellipse.lineWidth = 1
        ellipse.stroke()
    }
}
