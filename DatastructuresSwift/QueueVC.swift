//
//  QueueVC.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/21/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import UIKit

class QueueVC: UIViewController {

    @IBOutlet weak var txtFieldInput:UITextField!
    @IBOutlet weak var txtViewOutput:UITextView!
    
    var queue : Queue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queue = Queue()
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
    
    @IBAction func btnEnqueueTapped(sender: UIButton) {
        if (self.txtFieldInput.text == "") {
            let alert = UIAlertController(title: "Please enter a number!!!", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
        }
        else {
            queue.enqueue(Int(self.txtFieldInput.text!)!)
            txtViewOutput.text = queue.description
        }
    }
    
    @IBAction func btnDequeueTapped(sender: UIButton) {
        _ = queue.dequeue()
        txtViewOutput.text = queue.description
    }
    
    @IBAction func btnPeekTapped(sender: UIButton) {
        let topElement = queue.peek()
        if topElement != -1 {
            let alert = UIAlertController(title: "Top Element in the Queue", message:"\(String(describing: topElement!))", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Queue is empty!!!", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
        }
    }
}
