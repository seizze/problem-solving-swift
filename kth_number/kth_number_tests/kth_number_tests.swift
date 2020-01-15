//
//  kth_number_tests.swift
//  kth_number_tests
//
//  Created by Chaewan Park on 2020/01/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest

class kth_number_tests: XCTestCase {

    func test() {
        let result = solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])
        XCTAssertEqual(result, [5, 6, 3])
    }

}
