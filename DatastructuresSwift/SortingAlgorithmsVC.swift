
//
//  SortingAlgorithmsVC.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/22/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import UIKit

class SortingAlgorithmsVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtFieldInput: UITextField!
    @IBOutlet weak var txtViewOutput: UITextView!
    
    var array : Array<Int>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:))))
        array = Array<Int>()
    }
    
    func generateArray() -> Bool {        
        if (txtFieldInput.text?.isEmpty == true) {
            Utility.showAlertWith(title: "Alert", message: "Please enter values first.", viewController: self)
            return false
        }
        array.removeAll()
        for s in (txtFieldInput.text?.split(separator: ","))! {
            if Int(s) == nil {
                Utility.showAlertWith(title: "Alert", message: "Please enter valid numbers.", viewController: self)
                return false
            }
            array.append(Int.init(s.description)!)
        }
        return true
    }
    
    //MARK : UITextFieldDelegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        for s in (textField.text?.split(separator: ","))! {
            print(s)
            array.append(Int.init(s.description)!)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }

    @IBAction func btnBubbleSortTapped(sender : UIButton) {
        if (generateArray()) {
            let sort = BubbleSort(array: array)
            sort.bubbleSort(txtviewOutput: txtViewOutput)
        }
    }
    
    @IBAction func btnInsertionSortTapped(sender : UIButton) {
        if (generateArray()) {
            let sort = InsertionSort(array: array)
            sort.insertionSort(txtviewOutput: txtViewOutput)
        }
    }
    
    @IBAction func btnQuickSortTapped(sender : UIButton) {
        
    }
    
    @IBAction func btnMergeSortTapped(sender : UIButton) {
        if (generateArray()) {
            let sort = MergeSort(array: array)
            sort.helper = Array(repeating: 0, count: array.count)
            sort.mergeSort(low: 0, high: array.count-1, txtViewOutput: txtViewOutput)
        }
    }
    
    @IBAction func btnHeapSortTapped(sender : UIButton) {
        
    }
    
    @IBAction func btnSelectionSortTapped(sender : UIButton) {
        if (generateArray()) {
            let sort = SelectionSort(array: array)
            sort.selectionSort(txtviewOutput: txtViewOutput)
        }
    }
}
