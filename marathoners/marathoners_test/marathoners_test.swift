//
//  marathoners_test.swift
//  marathoners_test
//
//  Created by Chaewan Park on 2020/01/08.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import marathoners

class marathoners_test: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSimple() {
        XCTAssertEqual(solution(["leo", "kiki", "eden"], ["eden", "kiki"]), "leo")
        XCTAssertEqual(solution(
            ["marina", "josipa", "nikola", "vinko", "filipa"],
            ["josipa", "filipa", "marina", "nikola"]), "vinko")
    }
    
    func testDuplicated() {
        XCTAssertEqual(solution(["mislav", "stanko", "mislav", "ana"], ["stanko", "ana", "mislav"]), "mislav")
    }
}
