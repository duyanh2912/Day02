//
//  ArcViewController.swift
//  Day02
//
//  Created by Duy Anh on 12/27/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class ArcViewController: TriangleViewController {
    @IBOutlet weak var radiusText: UITextField!
    @IBOutlet weak var degreeText: UITextField!
    
    override func updateDrawView() {
        guard let arc = drawView as? CustomArcView else { return }
        
        guard let degree = Float(degreeText.text!),
            let radius = Float(radiusText.text!) else { return }
        
        arc.angleInDegree = CGFloat(degree)
        arc.radius = CGFloat(radius)
        
        arc.setNeedsDisplay()
        updateStats()
    }
    
    override func updateStats() {
        guard let arc = drawView as? CustomArcView else { return }
        
        let r = arc.radius
        let a = arc.angleInDegree
        
        areaLabel.text = "Area: \(r * r * CGFloat.pi * a / 360)"
        
        var perimeter: CGFloat
        if a <= 0 {
            perimeter = 0
        } else if a >= 360 {
            perimeter = 2 * r * CGFloat.pi
        } else {
            perimeter = a * r * CGFloat.pi / 180 + 2 * r
        }
        
        perimeterLabel.text = "Perimeter: \(perimeter)"
    }
    
    override func initialConfig() {
        guard let arc = drawView as? CustomArcView else { return }
        
        radiusText.delegate = self
        degreeText.delegate = self
        
        radiusText.text = arc.radius.description
        degreeText.text = arc.angleInDegree.description
    }
}
