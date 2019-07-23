//
//  InsertionSort.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/23/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import Foundation
import UIKit

class InsertionSort {
    
    var array: Array<Int>!
    
    init(array:Array<Int>) {
        self.array = array
    }
    
    public func insertionSort(txtviewOutput:UITextView) {
        var iteration = String()
        iteration += "INSERTION SORT\n"
        for i in 0..<array.count {
            for j in 0..<i {
                if array[i] < array[j] {
                    let tmp = array[j]
                    array[j] = array[i]
                    array[i] = tmp
                }
            }
            iteration += self.description + "\n"
        }
        txtviewOutput.text = iteration
    }
}

extension InsertionSort : CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        var text = "["
        // 4
        for i in 0..<array.count {
            text += "\(array[i])"
            if i < array.count-1 {
                text += ", "
            }
        }
        // 5
        return text + "]"
    }
}

