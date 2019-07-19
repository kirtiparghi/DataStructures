//
//  Node.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/19/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import Foundation

class Node {
    var data:Int
    var next:Node?
    var previous:Node?
    init(data:Int) {
        self.data = data
        self.next = nil
        self.previous = nil
    }
}

extension Node : Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        if (lhs.data == rhs.data && lhs.next == rhs.next && lhs.previous == rhs.previous) {
            return true
        }
        else {
            return false
        }
    }
}
