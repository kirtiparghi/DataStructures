//
//  LinkedList.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/19/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import Foundation

class LinkedList {
    
    fileprivate var head:Node?
    private var tail:Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first : Node? {
        return head
    }
    
    public var last: Node? {
        return tail
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func append(value: Int) {
        // 1
        let newNode = Node(data: value)
        // 2
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        }
            // 3
        else {
            head = newNode
        }
        // 4
        tail = newNode
    }
    
    public func insertAtBeginning(value : Int) {
        let newNode = Node(data: value)
        if head == nil {
            head = newNode
            tail = newNode
        }
        else {
            head?.previous = newNode
            newNode.next = head
            head = newNode
        }
    }
    
    public func insertInBetween(afterWhichElement element: Int, value : Int) {
        //find node after which new node will be added
        var tmpHead = head
        var nodeToSearch:Node!
        while(tmpHead?.next != nil) {
            if (tmpHead?.data == element) {
                nodeToSearch = tmpHead
                break
            }
            else {
                tmpHead = tmpHead?.next
            }
        }
        
        //add new node after searched node
        let newNode = Node(data: value)
        
        //check if searched node is head or not
        if (tmpHead?.data == tail?.data && tail?.data == element) {
            newNode.previous = tail
            tail?.next = newNode
            tail = newNode
        }
        else if (nodeToSearch != nil) {
            newNode.next = nodeToSearch?.next
            nodeToSearch?.next?.previous = newNode
            
            newNode.previous = nodeToSearch
            nodeToSearch?.next = newNode
        }
    }
    
    public func remove(value: Int) -> Int {
        //find node after which new node will be added
        var tmpHead = head
        var node:Node!
        while(tmpHead?.next != nil) {
            if (tmpHead?.data == value) {
                node = tmpHead
                break
            }
            else {
                tmpHead = tmpHead?.next
            }
        }
        
        if (tmpHead?.data == tail?.data && tail?.data == value) {
            node = tmpHead
        }
        
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next // 1
        } else {
            head = next // 2
        }
        next?.previous = prev // 3
        
        if next == nil {
            tail = prev // 4
        }
        
        // 5
        node.previous = nil
        node.next = nil
        
        // 6
        return node.data
    }
}

// 1
extension LinkedList: CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        var text = "["
        var node = head
        // 4
        while node != nil {
            text += "\(node!.data)"
            node = node!.next
            if node != nil { text += ", " }
        }
        // 5
        return text + "]"
    }
}
