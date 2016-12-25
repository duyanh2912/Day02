//
//  ContainerViewController.swift
//  Day02
//
//  Created by Developer on 12/25/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class EmptySegue: UIStoryboardSegue {
    override func perform() {
    }
}

class ContainerViewController: UIViewController {
    var lastViewController: UIViewController? = nil
    
    var currentMode: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if lastViewController != nil {
            lastViewController?.view.removeFromSuperview()
            lastViewController?.removeFromParentViewController()
        }
        
        let vc = segue.destination
        vc.view.frame = CGRect(x: 0,y: 0, width: self.view.frame.width,height: self.view.frame.height)
        self.addChildViewController(vc)
        self.view.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
        lastViewController = vc
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
