
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
        let sort = BubbleSort(array: array)
        sort.bubbleSort()
        print(sort.description)
    }
    
    @IBAction func btnInsertionSortTapped(sender : UIButton) {
        
    }
    
    @IBAction func btnQuickSortTapped(sender : UIButton) {
        
    }
    
    @IBAction func btnMergeSortTapped(sender : UIButton) {
        
    }
    
    @IBAction func btnHeapSortTapped(sender : UIButton) {
        
    }
}
