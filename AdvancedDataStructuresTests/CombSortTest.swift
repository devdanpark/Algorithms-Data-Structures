//
//  CombSortTest.swift
//  AdvancedDataStructuresTests
//
//  Created by Vladislav Fitc on 02.11.17.
//  Copyright © 2017 Fitc. All rights reserved.
//

import Foundation
import AdvancedDataStructures
import XCTest

class CombSortTests: XCTestCase {
    
    func testCorrectness() {
        
        var shuffledArray = Array(0..<1000)//[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]//
        shuffledArray.shuffle()
        
        let sortedArray = CombSort<Int>().sort(shuffledArray)
        
        XCTAssertTrue(sortedArray.isSorted)
        
    }
    
}
