//
//  NewYearChaos.swift
//  HackerRank
//
//  Created by Chaewan Park on 2020/07/08.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class NewYearChaos: Solution {
    func run() {
        minimumBribes(q: [2, 1, 5, 3, 4])
        minimumBribes(q: [2, 5, 1, 3, 4])
        minimumBribes(q: [1, 2, 5, 3, 7, 8, 6, 4])
    }
    
    func minimumBribes(q: [Int]) -> Void {
        var minimumBribes = 0
        
        for index in 0..<q.count {
            guard q[index] - index - 1 <= 2 else {
                print("Too chaotic")
                return
            }
            var formerIndex = max(0, q[index] - 2)
            while formerIndex < index {
                if q[formerIndex] > q[index] { minimumBribes += 1 }
                formerIndex += 1
            }
        }
        print(minimumBribes)
    }
}
