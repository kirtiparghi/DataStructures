//
//  BubbleSort.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/22/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import Foundation

class BubbleSort
{
    var array: Array<Int>!
    
    init(array:Array<Int>) {
        self.array = array
    }
    
    public func bubbleSort() {
        
        for i in 0..<array.count-1 {
            for j in 0..<array.count-i-1 {
                if array[j] > array[j+1] {
                    let tmp = array[j]
                    array[j] = array[j+1]
                    array[j+1] = tmp
                }
            }
        }
    }
}

extension BubbleSort : CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        var text = "["
        // 4
        for i in 0..<array.count-1 {
            text += "\(array[i])"
            if i < array.count-2 {
                text += ", "
            }
        }
        // 5
        return text + "]"
    }
}
