//
//  LinkedListVC.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/19/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import UIKit

class LinkedListVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtFieldInput: UITextField!
    @IBOutlet weak var txtViewOutput: UITextView!
    
    var linkedList = LinkedList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func btnInsertBeginningTapped(sender: UIButton) {
        linkedList.insertAtBeginning(value: Int(self.txtFieldInput.text!)!)
    }
    
    @IBAction func btnInsertAtEndTapped(sender: UIButton) {
        linkedList.append(value: Int(self.txtFieldInput.text!)!)
    }
    
    @IBAction func btnInsertInBetweenTapped(sender: UIButton) {
        let valueToAdded = Int(self.txtFieldInput.text!)!
        let alert = UIAlertController(title: "After which number you want to add new number?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter a number"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let number = alert.textFields?.first?.text {
                self.linkedList.insertInBetween(afterWhichElement: Int(number)!, value: valueToAdded)
            }
        }))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func btnPrintListTapped(sender: UIButton) {
        self.txtViewOutput.text = linkedList.description
    }
    
    @IBAction func btnRemoveElementTapped(sender: UIButton) {
        linkedList.remove(value: Int(self.txtFieldInput.text!)!)
    }
}
