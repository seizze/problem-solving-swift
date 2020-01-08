//
//  reverse_integer_test.swift
//  reverse_integer_test
//
//  Created by Chaewan Park on 2020/01/08.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import reverse_integer

class reverse_integer_test: XCTestCase {
    
    var solution: Solution!

    override func setUp() {
        solution = Solution()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testReverseInteger() {
        XCTAssertEqual(solution.reverse(123), 321)
        XCTAssertEqual(solution.reverse(-123), -321)
        XCTAssertEqual(solution.reverse(120), 21)
    }

}
