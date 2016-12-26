//
//  DrawEyeView.swift
//  Day02
//
//  Created by Developer on 12/25/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

@IBDesignable
public class DrawEyeView: UIView {
    @IBInspectable public var widthToHeightRatio: CGFloat = 3
    @IBInspectable public var lineWitdh: CGFloat = 1
  
    public override func draw(_ rect: CGRect) {
        let drawY: CGFloat
        let drawX: CGFloat
        
        if frame.width / frame.height > widthToHeightRatio {
            drawY = frame.height * (1 - lineWitdh / 1000)
            drawX = frame.height * widthToHeightRatio
        } else {
            drawX = frame.width - frame.width * lineWitdh / 1000 * widthToHeightRatio
            drawY = frame.width / widthToHeightRatio
        }
        
        let drawRect = CGRect(origin: CGPoint(x: frame.width / 2 - drawX / 2, y: frame.height / 2 - drawY / 2), size: CGSize(width: drawX, height: drawY))
        
        let eyePath = UIBezierPath()
        eyePath.move(to: CGPoint(x: drawRect.origin.x + drawRect.width / 2, y: drawRect.origin.y))
        eyePath.addArc(withCenter: drawRect.center(), radius: drawRect.height / 2, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi - CGFloat.pi / 2, clockwise: true)
        
        UIColor.black.setStroke()
        eyePath.lineWidth = lineWitdh * frame.height / 1000
        eyePath.stroke()
        
        let upperAnchor = drawRect.center().add(x: 0, y: -drawY / 2)
        let upperCenter = upperAnchor.add(x: 0, y: (drawX * drawX + drawY * drawY) / (drawY * 4))
        
        let lowerAnchor = drawRect.center().add(x: 0, y: drawY / 2)
        let lowerCenter = lowerAnchor.add(x: 0, y: -(drawX * drawX + drawY * drawY) / (drawY * 4))
        
        print(upperAnchor.distance(to: upperCenter))
        print(upperCenter.distance(to: drawRect.origin.add(x: drawX, y: drawY/2)))
        
        let radius = upperAnchor.distance(to: upperCenter)
        let angle = atan(drawX / drawY)
        
        let curve = UIBezierPath()
        curve.move(to: drawRect.origin.add(x: drawX, y: drawY / 2))
        curve.addArc(withCenter: upperCenter,
                     radius: radius,
                     startAngle: (CGFloat.pi - 2 * angle) - CGFloat.pi / 2,
                     endAngle: -(CGFloat.pi - 2 * angle) - CGFloat.pi / 2,
                     clockwise: false)
        curve.addArc(withCenter: lowerCenter,
                     radius: radius,
                     startAngle: (CGFloat.pi - 2 * angle) + CGFloat.pi / 2,
                     endAngle: -(CGFloat.pi - 2 * angle) + CGFloat.pi / 2,
                     clockwise: false)
        curve.close()
        curve.lineWidth = lineWitdh * frame.height / 1000
        curve.stroke()
    }
}
