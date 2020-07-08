//
//  DynamicArray.swift
//  HackerRank
//
//  Created by Chaewan Park on 2020/07/08.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class DynamicArray: Solution {
    func run() {
        let result = dynamicArray(n: 2, queries: input)
        assert(result == [7, 3])
    }
    
    func dynamicArray(n: Int, queries: [[Int]]) -> [Int] {
        var answer = [Int]()
        var sequenceList = Array(repeating: [Int](), count: n)
        var lastAnswer = 0
        
        for query in queries {
            let (command, x, y) = (query[0], query[1], query[2])
            let index = (x ^ lastAnswer) % n
            switch command {
            case 1:
                sequenceList[index].append(y)
            case 2:
                lastAnswer = sequenceList[index][y % sequenceList[index].count]
                answer.append(lastAnswer)
            default: continue
            }
        }
        return answer
    }
}

let input = [
    [1, 0, 5],
    [1, 1, 7],
    [1, 0, 3],
    [2, 1, 0],
    [2, 1, 1],
]
