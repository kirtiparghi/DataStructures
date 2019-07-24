//
//  QuickSort.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/23/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import Foundation
import UIKit

class QuickSort {
    
    var array: Array<Int>!
    
    init(array:Array<Int>) {
        self.array = array        
    }

    func quicksort(left: Int, right: Int, txtViewOutput: UITextView) {
        if right > left {
            let pivotIndex = partition(left: left, right: right, txtViewOutput: txtViewOutput)
            quicksort(left: left, right: pivotIndex-1, txtViewOutput: txtViewOutput)
            quicksort(left: pivotIndex+1, right: right, txtViewOutput: txtViewOutput)
        }
    }
    
    func partition(left: Int, right: Int, txtViewOutput: UITextView) -> Int {
        var i = left
        for j in (left + 1)..<(right + 1) {
            if array[j] < array[left] {
                i += 1
                (array[i], array[j]) = (array[j], array[i])
            }
        }
        (array[i], array[left]) = (array[left], array[i])
        txtViewOutput.text.append(self.description + "\n")
        return i
    }
}

extension QuickSort : CustomStringConvertible {
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
