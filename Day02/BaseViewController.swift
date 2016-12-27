//
//  BaseViewController.swift
//  Day02
//
//  Created by Duy Anh on 12/27/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    @IBOutlet weak var drawView: CustomDrawView!
    @IBOutlet weak var factorSlide: UISlider!
    
    @IBOutlet weak var perimeterLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!

    // Bottom constraint for resizing the view when the keyboard appears
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    var originalBottomConstraintConstant: CGFloat!
    
    // Press the illuminati button
    @IBAction func illuminati(_ sender: UIButton) {
        view.endEditing(true)
        updateDrawView()
    }

    // Changed the value of the slider
    @IBAction func factorChanged(_ sender: UISlider) {
        drawView.scale = CGFloat(sender.value)
        
        // update view immediately
        drawView.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originalBottomConstraintConstant = bottomConstraint.constant
        
        // Notify when the keyboard show or hide
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        factorSlide.value = 1
        initialConfig()
    }
    
    func initialConfig() {
        // Custom code in subclass
    }
    
    func updateDrawView() {
        // Custom code in subclass
    }
    
    // Adjust the bottom constraint when the keyboard show or hide
    func keyboardWillShow(sender: NSNotification) {
        let info = sender.userInfo!
        let keyboardSize = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        bottomConstraint.constant = keyboardSize - bottomLayoutGuide.length + originalBottomConstraintConstant
        
        let duration: TimeInterval = (info[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
        
    }
    
    func keyboardWillHide(sender: NSNotification) {
        let info = sender.userInfo!
        let duration: TimeInterval = (info[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        bottomConstraint.constant = originalBottomConstraintConstant
        
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
}
