//
//  BubbleSort.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/22/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import Foundation
import UIKit

class BubbleSort
{
    var array: Array<Int>!
    
    init(array:Array<Int>) {
        self.array = array
    }
    
    public func bubbleSort(txtviewOutput:UITextView) {
        var iteration = String()
        iteration += "BUBBLE SORT\n"
        for i in 0..<self.array.count {
            for j in 0..<self.array.count-i-1 {
                if self.array[j] > self.array[j+1] {
                    let tmp = self.array[j]
                    self.array[j] = self.array[j+1]
                    self.array[j+1] = tmp
                }
            }
            iteration += self.description + "\n"
        }
        txtviewOutput.text = iteration
    }
}

extension BubbleSort : CustomStringConvertible {
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
