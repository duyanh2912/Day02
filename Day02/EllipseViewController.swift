//
//  EllipseViewController.swift
//  Day02
//
//  Created by Duy Anh on 12/27/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class EllipseViewController: TriangleViewController {
    @IBOutlet weak var firstRadiusText: UITextField!
    @IBOutlet weak var secondRadiusText: UITextField!
    
    override func updateDrawView() {
        guard let ellipse = drawView as? CustomEllipseView else { return }
        
        guard let firstAxis = Float(firstRadiusText.text!),
            let secondAxis = Float(secondRadiusText.text!) else { return }
        
        ellipse.firstRadius = CGFloat(firstAxis)
        ellipse.secondRadius = CGFloat(secondAxis)
        
        ellipse.setNeedsDisplay()
        updateStats()
    }
    
    override func initialConfig() {
        guard let ellipse = drawView as? CustomEllipseView else { return }
        
        firstRadiusText.delegate = self
        secondRadiusText.delegate = self
        
        firstRadiusText.text = ellipse.firstRadius.description
        secondRadiusText.text = ellipse.secondRadius.description
    }
    
    override func updateStats() {
        guard let ellipse = drawView as? CustomEllipseView else { return }
        
        let a = ellipse.firstRadius
        let b = ellipse.secondRadius
        
        areaLabel.text = "Area: \(a * b * CGFloat.pi)"
    }
}
