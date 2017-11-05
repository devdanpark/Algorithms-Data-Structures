//
//  InOrderTreeTraversal.swift
//  AdvancedDataStructures
//
//  Created by Vladislav on 05/11/2017.
//  Copyright © 2017 Fitc. All rights reserved.
//

import Foundation

struct InOrderTreeTraversal<Key: Comparable, Value>: TreeTraversal {
    
    var visit: (BinaryTree<Key, Value>) -> () = { print($0.key, terminator: " - ") }
    
    func traverse(_ tree: BinaryTree<Key, Value>) {

        if let leftBranch = tree.left {
            traverse(leftBranch)
        }
        
        visit(tree)

        if let rightBranch = tree.right {
            traverse(rightBranch)
        }
        
    }
    
}
