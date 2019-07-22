//
//  Queue.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/21/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import Foundation

// 1
public struct Queue {
    
    // 2
    fileprivate var list = LinkedList()
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    // 3
    public mutating func enqueue(_ element: Int) {
        list.append(value: element)
    }
    
    // 4
    public mutating func dequeue() -> Int? {
        guard !list.isEmpty, let element = list.first?.data else { return nil }
        _ = list.remove(value: element)
        return element
    }
    
    // 5
    public func peek() -> Int? {
        return list.first?.data
    }
}

// 1
extension Queue: CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        return list.description
    }
}
