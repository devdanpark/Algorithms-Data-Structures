//
//  ShellSort.swift
//  AdvancedDataStructures
//
//  Created by Vladislav Fitc on 02.11.17.
//  Copyright © 2017 Fitc. All rights reserved.
//

import Foundation

struct ShellSort<Element: Comparable>: SortAlgorithm {
    
    let n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func sort(_ array: [Element]) -> [Element] {
        
        var array = array
//
//        for i in 0..<(array.count/n + 1) {
//
//        }
//
//        for lastUnsortedIndex in stride(from: 0, to: array.endIndex, by: n) {
//
//            var insertedIndex = lastUnsortedIndex
//
//            stride(from: <#T##Strideable#>, to: <#T##Strideable#>, by: <#T##Comparable & SignedNumeric#>)
//
//        }
//
//        for lastUnsortedIndex in 0..<array.endIndex {
//
//            var insertedIndex = lastUnsortedIndex
//
//            for sortedIndex in (array.startIndex..<lastUnsortedIndex).reversed() {
//
//                if array[sortedIndex] > array[insertedIndex] {
//                    array.swapAt(sortedIndex, insertedIndex)
//                    insertedIndex = sortedIndex
//                } else {
//                    break
//                }
//
//            }
//
//        }
        
        return array

    }
    
}
