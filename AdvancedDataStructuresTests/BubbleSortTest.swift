//
//  BubbleSortTest.swift
//  AdvancedDataStructuresTests
//
//  Created by Vladislav Fitc on 02.11.17.
//  Copyright © 2017 Fitc. All rights reserved.
//

import Foundation
import AdvancedDataStructures
import XCTest

class BubbleSortTests: XCTestCase {
    
    func testCorrectness() {
        
        var shuffledArray = Array(0..<1000)
        shuffledArray.shuffle()
        
        let sortedArray = BubbleSort<Int>().sort(shuffledArray)
        
        XCTAssertTrue(sortedArray.isSorted)
        
    }

}
