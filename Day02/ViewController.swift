//
//  ViewController.swift
//  Day02
//
//  Created by Developer on 12/25/16.
//  Copyright © 2016 Developer. All rights reserved.
//
import Utils
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var segmenntedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmenntedControl.addTarget(self, action: #selector(changedSegment(_:)), for: .valueChanged)
    }
    
    func changedSegment(_ sender: UISegmentedControl) {
        // self.childViewControllers[0] is a ContainerViewController
        
        if let title = sender.titleForSegment(at: sender.selectedSegmentIndex) {
        self.childViewControllers[0].performSegue(withIdentifier: "ContainerTo\(title)", sender: nil)
        }
    }
}
