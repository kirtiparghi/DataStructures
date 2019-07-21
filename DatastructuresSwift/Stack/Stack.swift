//
//  Stack.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/20/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

// Stack is one type of data structure which is working in LIFO(Last In First Out) order.
import Foundation

class Stack {
    
    var array = Array<Int>()
    
    public func push(value: Int) {
        array.append(value)
    }
    
    public func pop() {
        if (!isEmpty()) {
            array.remove(at: array.count-1)
        }
    }
    
    public func top() -> Int {
        if isEmpty() {
            return -1
        }
        else {
            return array[array.count-1]
        }
    }
    
    public func isEmpty() -> Bool {
        if array.count == 0 {
            return true
        }
        return false
    }
}
