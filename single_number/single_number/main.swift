//
//  main.swift
//  single_number
//
//  Created by Chaewan Park on 2020/01/22.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var counter = Dictionary<Int, Bool>()
        nums.forEach { counter[$0] = counter[$0] == true ? nil : true }
        return counter.keys.first!
    }
}
