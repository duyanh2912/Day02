//
//  TriangleViewController.swift
//  Day02
//
//  Created by Developer on 12/26/16.
//  Copyright © 2016 Developer. All rights reserved.
//
import Utils
import UIKit

class TriangleViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var drawView: CustomDrawView!
    @IBOutlet weak var factorSlide: UISlider!
    
    @IBOutlet weak var perimeterLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    
    @IBOutlet weak var firstEdgeText: UITextField!
    @IBOutlet weak var secondEdgeText: UITextField!
    @IBOutlet weak var thirdEdgeText: UITextField!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    var originalBottomConstraintConstant: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originalBottomConstraintConstant = bottomConstraint.constant
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)

        // Do any additional setup after loading the view.
        
        factorSlide.value = 1
        initialConfig()
    }
    
    func initialConfig() {
        guard let triangle = drawView as? CustomTriangleView else { return }
        
        firstEdgeText.text = triangle.firstEdge.description
        secondEdgeText.text = triangle.secondEdge.description
        thirdEdgeText.text = triangle.thirdEdge.description
        
        firstEdgeText.delegate = self
        secondEdgeText.delegate = self
        thirdEdgeText.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateDrawView() {
        guard let firstEdge = Float(firstEdgeText.text!),
            let secondEdge = Float(secondEdgeText.text!),
            let thirdEdge = Float(thirdEdgeText.text!)
            else { return }
        guard let triangleView = drawView as? CustomTriangleView else { return }
        
        triangleView.scale = CGFloat(factorSlide.value)
        triangleView.firstEdge = CGFloat(firstEdge)
        triangleView.secondEdge = CGFloat(secondEdge)
        triangleView.thirdEdge = CGFloat(thirdEdge)
        triangleView.setNeedsDisplay()
        
        updateStats()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func illuminati(_ sender: Any) {
        view.endEditing(true)
        updateDrawView()
    }
    
    @IBAction func factorChanged(_ sender: UISlider) {
        drawView.scale = CGFloat(sender.value)
        drawView.setNeedsDisplay()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
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
