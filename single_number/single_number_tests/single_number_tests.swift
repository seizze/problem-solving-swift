//
//  single_number_tests.swift
//  single_number_tests
//
//  Created by Chaewan Park on 2020/01/22.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import single_number

class single_number_tests: XCTestCase {
    
    var solution: Solution!

    override func setUp() {
        solution = Solution()
    }
    
    func testSingleNumber() {
        XCTAssertEqual(solution.singleNumber([2, 2, 1]), 1)
        XCTAssertEqual(solution.singleNumber([4,1,2,1,2]), 4)
    }
}
