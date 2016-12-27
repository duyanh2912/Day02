//
//  RectViewController.swift
//  Day02
//
//  Created by Duy Anh on 12/26/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class RectViewController: BaseViewController {
    @IBOutlet weak var firstEdgeText: UITextField!
    @IBOutlet weak var secondEdgeText: UITextField!
    
    override func updateDrawView() {
        guard let rect = drawView as? CustomRectView else { return }
        
        guard let firstEdge = Float(firstEdgeText.text!),
            let secondEdge = Float(secondEdgeText.text!)
            else { return }
        
        rect.firstEdge = CGFloat(firstEdge)
        rect.secondEdge = CGFloat(secondEdge)
        rect.setNeedsDisplay()
        
        updateStats()
    }
    
    func updateStats() {
        guard let firstEdge = Float(firstEdgeText.text!),
            let secondEdge = Float(secondEdgeText.text!)
            else { return }
        
        perimeterLabel.text = "Perimeter: \(2*firstEdge + 2*secondEdge)"
        areaLabel.text = "Area: \(firstEdge * secondEdge)"
    }
    
    override func initialConfig() {
        guard let rect = drawView as? CustomRectView else { return }
        
        firstEdgeText.text = rect.firstEdge.description
        secondEdgeText.text = rect.secondEdge.description
    }
}
