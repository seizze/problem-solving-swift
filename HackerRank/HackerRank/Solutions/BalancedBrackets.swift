//
//  BalancedBrackets.swift
//  HackerRank
//
//  Created by Chaewan Park on 2020/07/13.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class BalancedBrackets: Solution {
    func run() {
        isBalanced(s: "{[()]}")
        isBalanced(s: "{[(])}")
        isBalanced(s: "{{[[(())]]}}")
    }
    
    func isBalanced(s: String) {
        let isOpening: [Character: Bool] = ["(": true, ")": false, "{": true, "}": false, "[": true, "]": false]
        let pairs: [Character: Character] = ["(": ")", "{": "}", "[": "]"]
        var stack = [Character]()
        
        for bracket in s {
            if isOpening[bracket]! {
                stack.append(bracket)
            } else {
                guard let lastBracket = stack.popLast(), pairs[lastBracket] == bracket else {
                    print("NO")
                    return
                }
            }
        }
        
        if stack.isEmpty {
            print("YES")
        } else {
            print("NO")
        }
    }
}
