//
//  BinaryTree.swift
//  AdvancedDataStructures
//
//  Created by Vladislav Fitc on 24.10.17.
//  Copyright © 2017 Fitc. All rights reserved.
//

import Foundation

final class BinaryTree<Key: Comparable, Value>: IBinaryTreeProtocol {

    var key: Key
    var value: Value
    
    var left: BinaryTree? {
        didSet {
            left?.parent = self
        }
    }
    
    var right: BinaryTree? {
        didSet {
            right?.parent = self
        }
    }
    
    weak var parent: BinaryTree?
    
    init(key: Key, value: Value, left: BinaryTree? = .none, right: BinaryTree? = .none, parent: BinaryTree? = .none) {
        self.key = key
        self.value = value
        self.left = left
        self.right = right
        self.parent = parent
    }
    
    func set(_ value: Value, for key: Key) {
        
        if key == self.key {
            
            self.value = value
            
        } else if key < self.key {
            
            if let leftBranch = self.left {
                leftBranch.set(value, for: key)
            } else {
                self.left = BinaryTree(key: key, value: value, parent: self)
            }
            
        } else {
            
            if let rightBranch = self.right {
                rightBranch.set(value, for: key)
            } else {
                self.right = BinaryTree(key: key, value: value, parent: self)
            }
            
        }
        
    }
    
    func removeValue(for key: Key) -> BinaryTree? {
        
        if key == self.key {
            
            switch (left, right) {
            case (.none, .none):
                
                switch parentRelation {
                case .leftSubtree:
                    parent?.left = .none
                    return parent?.root()
                    
                case .rightSubtree:
                    parent?.right = .none
                    return parent?.root()
                    
                case .root:
                    return .none
                }
                
            case (let leftSubtree, .none):
                
                switch parentRelation {
                case .leftSubtree:
                    parent?.left = leftSubtree
                    return parent?.root()
                    
                case .rightSubtree:
                    parent?.right = leftSubtree
                    return parent?.root()
                    
                case .root:
                    return leftSubtree
                }
                
            case (.none, let rightSubtree):
                
                switch parentRelation {
                case .leftSubtree:
                    parent?.left = rightSubtree
                    return parent?.root()
                    
                case .rightSubtree:
                    parent?.right = rightSubtree
                    return parent?.root()
                    
                case .root:
                    return rightSubtree
                }
                
            case (.some, .some):
                let nextElement = self.next()!
                let updatedTree = removeValue(for: nextElement.key)
                let nodeToRemove = updatedTree?.findNode(for: self.key)
                nodeToRemove?.key = nextElement.key
                nodeToRemove?.value = nextElement.value
                return nodeToRemove?.root()
            }
            
        } else if key < self.key {
            return left?.removeValue(for: key) ?? self.root()
        } else {
            return right?.removeValue(for: key) ?? self.root()
        }
        
    }
    
}

//MARK: - Init with array

extension BinaryTree {
    
    convenience init?(array: [(key: Key, value: Value)]) {
        guard let firstElement = array.first else { return nil }
        self.init(key: firstElement.key, value: firstElement.value)
        array.dropFirst().forEach { set($0.value, for: $0.key) }
    }
    
    static func with<K: Comparable>(array: [K]) -> BinaryTree<K, Void>? {
        let treeArray = array.map({ (key: $0, value: ()) })
        return BinaryTree<K, Void>(array: treeArray)
    }
    
}

//MARK: - CustomStringConvertible

extension BinaryTree: CustomStringConvertible {
    
    var description: String {
        
        return BinaryTreePrinter.treeString(self, using: { (tree) in
            return ("\(tree.key)", tree.left, tree.right)
        })
        
    }
    
    func draw() {
        left?.draw(indent: "", "    ", " |  ")
        print("\(key)")
        right?.draw(indent: "", " |  ", "    ")
    }
    
    func draw(indent: String, _ leftIndent: String, _ rightIndent: String) {
        left?.draw(indent: leftIndent, leftIndent + "    ", leftIndent + " |  ")
        print(indent + " +- " + "\(key)")
        right?.draw(indent: rightIndent, rightIndent + " |  ", rightIndent + "    ")
    }
    
}
