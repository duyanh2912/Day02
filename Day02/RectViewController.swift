//
//  RectViewController.swift
//  Day02
//
//  Created by Duy Anh on 12/26/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class RectViewController: TriangleViewController {
    
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
    
    override func updateStats() {
        guard let firstEdge = Float(firstEdgeText.text!),
            let secondEdge = Float(secondEdgeText.text!)
            else { return }
        
        perimeterLabel.text = "Perimeter: \(2*firstEdge + 2*secondEdge)"
        areaLabel.text = "Area: \(firstEdge * secondEdge)"
    }
    
    override func initialConfig() {
        guard let rect = drawView as? CustomRectView else { return }
        
        firstEdgeText.delegate = self
        secondEdgeText.delegate = self
        
        firstEdgeText.text = rect.firstEdge.description
        secondEdgeText.text = rect.secondEdge.description
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
