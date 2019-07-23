//
//  BinaryTreeVC.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/21/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import UIKit

class BinaryTreeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // leaf nodes
        let node5 = BinaryTree.node(.empty, "5", .empty)
        let nodeA = BinaryTree.node(.empty, "a", .empty)
        let node10 = BinaryTree.node(.empty, "10", .empty)
        let node4 = BinaryTree.node(.empty, "4", .empty)
        let node3 = BinaryTree.node(.empty, "3", .empty)
        let nodeB = BinaryTree.node(.empty, "b", .empty)
        
        // intermediate nodes on the left
        let Aminus10 = BinaryTree.node(nodeA, "-", node10)
        _ = BinaryTree.node(node5, "*", Aminus10)
        
        // intermediate nodes on the right
        let minus4 = BinaryTree.node(.empty, "-", node4)
        let divide3andB = BinaryTree.node(node3, "/", nodeB)
        _ = BinaryTree.node(minus4, "*", divide3andB)
        
        // root node
        var tree: BinaryTree<Int> = .empty
        tree.insert(newValue: 7)
        tree.insert(newValue: 10)
        tree.insert(newValue: 2)
        tree.insert(newValue: 1)
        tree.insert(newValue: 5)
        tree.insert(newValue: 9)
        tree.insert(newValue: 3)
        
        tree.traverseInOrder { print($0) }
        tree = tree.search(searchValue: 5)!
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
