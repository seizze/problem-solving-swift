//
//  main.swift
//  roman_to_integer
//
//  Created by Chaewan Park on 2020/02/09.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        let values = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000,
                     "IV": 4, "IX": 9, "XL": 40, "XC": 90, "CD": 400, "CM": 900]
        var roman = s
        var integer = 0
        
        while roman.count > 0 {
            if roman.count > 1,
                let number = values[String(roman.prefix(2))] {
                integer += number
                roman.removeFirst(2)
            } else {
                integer += values[String(roman.removeFirst())]!
            }
        }
        return integer
    }
}

