//
//  KthNumber.swift
//  Programmers
//
//  Created by Chaewan Park on 2020/07/09.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class KthNumber: Solution {
    func run() {
        assert(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]) == [5, 6, 3])
    }
    
    func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
        return commands.map { findKthNumber(array, $0) }
    }
    
    func findKthNumber(_ array: [Int], _ command: [Int]) -> Int {
        let subArray = array[(command[0] - 1)...(command[1] - 1)].sorted()
        return subArray[command[2] - 1]
    }
}
