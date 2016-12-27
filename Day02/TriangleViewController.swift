//
//  TriangleViewController.swift
//  Day02
//
//  Created by Developer on 12/26/16.
//  Copyright © 2016 Developer. All rights reserved.
//
import Utils
import UIKit

class TriangleViewController: BaseViewController {
    @IBOutlet weak var firstEdgeText: UITextField!
    @IBOutlet weak var secondEdgeText: UITextField!
    @IBOutlet weak var thirdEdgeText: UITextField!
    
    override func updateDrawView() {
        guard let a = Float(firstEdgeText.text!),
            let b = Float(secondEdgeText.text!),
            let c = Float(thirdEdgeText.text!)
            else { return }
        
        if a + b <= c { showError(); return }
        if a + c <= b { showError(); return }
        if b + c <= a { showError(); return }
        
        guard let triangleView = drawView as? CustomTriangleView else { return }
        
        // update parameters
        triangleView.scale = CGFloat(factorSlide.value)
        triangleView.firstEdge = CGFloat(a)
        triangleView.secondEdge = CGFloat(b)
        triangleView.thirdEdge = CGFloat(c)
        
        // update the view
        triangleView.setNeedsDisplay()
        
        updateStats()
    }
    
    func showError() {
        let ac = UIAlertController(title: "Error", message: "This is not a triangle", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Okay", style: .cancel)
        ac.addAction(cancel)
        present(ac, animated: true)
    }
    
    func updateStats() {
        guard let firstEdge = Float(firstEdgeText.text!),
            let secondEdge = Float(secondEdgeText.text!),
            let thirdEdge = Float(thirdEdgeText.text!)
            else { return }
        
        let p = (firstEdge + secondEdge + thirdEdge) / 2
        
        perimeterLabel.text = "Perimeter: \((2 * p).description)"
        areaLabel.text! = "Area: \(sqrt(p * (p-firstEdge) * (p-secondEdge) * (p-thirdEdge)).description)"
    }

    
    override func initialConfig() {
        guard let triangle = drawView as? CustomTriangleView else { return }
        
        firstEdgeText.text = triangle.firstEdge.description
        secondEdgeText.text = triangle.secondEdge.description
        thirdEdgeText.text = triangle.thirdEdge.description
    }
    
  }
