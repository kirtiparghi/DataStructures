//
//  BinaryTree.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/21/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import Foundation

enum BinaryTree<T: Comparable> {
    
    case empty
    indirect case node(BinaryTree<T>, T, BinaryTree<T>)
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    // 1.
    mutating func naiveInsert(newValue: T) {
        // 2.
        guard case .node(var left, let value, var right) = self else {
            // 3.
            self = .node(.empty, newValue, .empty)
            return
        }
        
        // 4. TODO: Implement naive algorithm!
        if newValue < value {
            left.naiveInsert(newValue: newValue)
        } else {
            right.naiveInsert(newValue: newValue)
        }
        
    }
    
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
        switch self {
        // 1
        case .empty:
            return .node(.empty, newValue, .empty)
        // 2
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
    
    mutating func insert(newValue: T) {
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    func traverseInOrder(process: (T) -> ()) {
        switch self {
        // 1
        case .empty:
            return
        // 2
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    func traversePreOrder( process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    func traversePostOrder( process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
    
    func search(searchValue: T) -> BinaryTree? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            // 1
            if searchValue == value {
                return self
            }
            
            // 2
            if searchValue < value {
                return left.search(searchValue: searchValue)
            } else {
                return right.search(searchValue: searchValue)
            }
        }
    }
    
}

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
}
