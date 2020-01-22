//
//  happy_number_tests.swift
//  happy_number_tests
//
//  Created by Chaewan Park on 2020/01/22.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest

class happy_number_tests: XCTestCase {

    var solution: Solution!
    
    override func setUp() {
        solution = Solution()
    }
    
    func testHappyNumberDistinguisher() {
        XCTAssertTrue(solution.isHappy(19))
        XCTAssertFalse(solution.isHappy(2))
    }
}
