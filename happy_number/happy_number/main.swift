//
//  main.swift
//  happy_number
//
//  Created by Chaewan Park on 2020/01/22.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var isRecursive = Dictionary<Int, Bool>()
        var squareSum = 0, number = n
        while squareSum != 1 {
            squareSum = String(number).map { Int(String($0))! }.reduce(0) { $0 + $1 * $1 }
            if isRecursive[squareSum] == true { return false }
            isRecursive[squareSum] = true
            number = squareSum
        }
        return true
    }
}
