//
//  MergeSort.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/23/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import Foundation
import UIKit

class MergeSort
{
    var array: Array<Int>!
    var helper: Array<Int>!
    
    init(array:Array<Int>) {
        self.array = array
        self.helper = Array<Int>()
    }
    
    public func mergeSort(low: Int, high: Int, txtViewOutput: UITextView) {
        if low < high {
            let middle = low + (high-low)/2
            mergeSort(low: low, high: middle, txtViewOutput: txtViewOutput)
            mergeSort(low: middle+1, high: high, txtViewOutput: txtViewOutput)
            merge(low: low, middle: middle, high: high, txtViewOutput: txtViewOutput)
        }
    }
    
    public func merge(low: Int, middle: Int, high: Int, txtViewOutput: UITextView) {
        // Copy both parts into the helper array
        for i in low...high {
            helper[i] = array[i]
        }
        var i = low;
        var j = middle + 1;
        var k = low;
        
        // Copy the smallest values from either the left or the right side back
        // to the original array
        while (i <= middle && j <= high) {
            if (helper[i] <= helper[j]) {
                array[k] = helper[i]
                i+=1
            } else {
                array[k] = helper[j]
                j+=1
            }
            k+=1
        }
        // Copy the rest of the left side of the array into the target array
        while (i <= middle) {
            array[k] = helper[i]
            k+=1
            i+=1
        }
        txtViewOutput.text.append(self.description + "\n")
    }
}

extension MergeSort : CustomStringConvertible {
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
