//
//  StackVC.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/21/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import UIKit

class StackVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtFieldInput:UITextField!
    @IBOutlet weak var txtViewOutput:UITextView!
    
    var stack : Stack!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stack = Stack()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:))))
    }
    
    //MARK : UITextFieldDelegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }

    @IBAction func btnPushTapped(sender: UIButton) {
        if (self.txtFieldInput.text == "") {
            let alert = UIAlertController(title: "Please enter a number!!!", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
        }
        else {
            stack.push(value: Int(self.txtFieldInput.text!)!)
            txtViewOutput.text = stack.array.description
        }
    }
    
    @IBAction func btnPopTapped(sender: UIButton) {
        stack.pop()
        txtViewOutput.text = stack.array.description
    }
    
    @IBAction func btnTopTapped(sender: UIButton) {
        let topElement = stack.top()
        if topElement != -1 {
            let alert = UIAlertController(title: "Top Element in the stack", message:"\(topElement)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Stack is empty!!!", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
        }
    }
}
