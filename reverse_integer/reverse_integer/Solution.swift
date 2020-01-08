//
//  Solution.swift
//  reverse_integer
//
//  Created by Chaewan Park on 2020/01/08.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        var indicator = Int32(x)
        var result: Int32 = 0
        
        while indicator != 0 {
            let multiplied = result.multipliedReportingOverflow(by: 10)
            
            if multiplied.overflow {
                return 0
            }
            
            result = multiplied.partialValue + indicator % 10
            indicator = indicator / 10
        }
        
        return Int(result)
    }
}

