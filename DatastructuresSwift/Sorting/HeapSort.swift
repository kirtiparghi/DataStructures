//
//  HeapSort.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/23/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import Foundation
import UIKit

class HeapSort {
 
    var array: Array<Int>!
    
    init(array:Array<Int>) {
        self.array = array
    }

    
}

extension HeapSort : CustomStringConvertible {
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
