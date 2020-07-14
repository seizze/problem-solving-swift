//
//  SherlockAndTheValidString.swift
//  HackerRank
//
//  Created by Chaewan Park on 2020/07/14.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class SherlockAndTheValidString: Solution {
    func run() {
        isValid(s: "aabbcd") // NO
        isValid(s: "aabbccddeefghi") // NO
        isValid(s: "abcdefghhgfedecba") // YES
    }
    
    func isValid(s: String) {
        let labeled = zip(s, Array(repeating: 1, count: s.count))
        let hashed = Dictionary(labeled, uniquingKeysWith: +)
        let values = hashed.values
        let labeledValues = zip(values, Array(repeating: 1, count: values.count))
        let valueCount = Dictionary(labeledValues, uniquingKeysWith: +)
        
        if valueCount.count == 1 {
            print("YES")
            return
        }
        
        if valueCount.count > 2 {
            print("NO")
            return
        }
        
        let numbers = valueCount.sorted(by: <)
        
        if numbers[0].key == 1 && numbers[0].value == 1 {
            print("YES")
            return
        }
        
        if (numbers[1].key - numbers[0].key) == 1 && numbers[1].value == 1 {
            print("YES")
            return
        }
        print("NO")
    }
}
