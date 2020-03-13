//
//  main.swift
//  valid_parentheses
//
//  Created by Chaewan Park on 2020/03/13.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Solution {
    let pairs: Dictionary<Character, Character> = [")": "(", "}": "{", "]": "["]
    var stack = [Character]()
    
    func isValid(_ s: String) -> Bool {
        var input = s
        while !input.isEmpty {
            let bracket = input.removeFirst()
            if pairs.values.contains(bracket) { stack.append(bracket) }
            else {
                if stack.isEmpty { return false }
                if pairs[bracket] != stack.removeLast() { return false }
            }
        }
        if !stack.isEmpty { return false }
        return true
    }
}
