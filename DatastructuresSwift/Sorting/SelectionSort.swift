//
//  SelectionSort.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/23/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import Foundation
import UIKit

class SelectionSort {
    
    var array: Array<Int>!
    
    init(array:Array<Int>) {
        self.array = array
    }
    
    public func selectionSort(txtviewOutput:UITextView) {
        var iteration = String()
        iteration += "SELECTION SORT\n"
        var iMin = 0
        for i in 0..<array.count {
            iMin = i
            for j in i+1..<array.count {
                if array[j] < array[iMin] {
                    iMin = j
                }
            }
            let tmp = array[i]
            array[i] = array[iMin]
            array[iMin] = tmp
            iteration += self.description + "\n"
        }
        txtviewOutput.text = iteration
    }
}

extension SelectionSort : CustomStringConvertible {
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

