//
//  ClimbingTheLeaderboard.swift
//  HackerRank
//
//  Created by Chaewan Park on 2020/07/08.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class ClimbingTheLeaderboard: Solution {
    func run() {
        let result1 = climbingLeaderboard(scores: [100, 100, 50, 40, 40, 20, 10], alice: [5, 25, 50, 120])
        assert(result1 == [6, 4, 2, 1])
        let result2 = climbingLeaderboard(scores: [100, 90, 90, 80, 75, 60], alice: [50, 65, 77, 90, 102])
        assert(result2 == [6, 5, 4, 2, 1])
    }
    
    func climbingLeaderboard(scores: [Int], alice: [Int]) -> [Int] {
        var answer = [Int]()
        var index = 0
        var aliceIndex = alice.count - 1
        var rank = 1
        
        while aliceIndex >= 0 && alice[aliceIndex] >= scores[index] {
            answer.append(rank)
            aliceIndex -= 1
        }
        
        while index < scores.count {
            while aliceIndex >= 0 && alice[aliceIndex] >= scores[index] {
                answer.append(rank)
                aliceIndex -= 1
            }
            let currentScore = scores[index]
            while index < scores.count && scores[index] == currentScore { index += 1 }
            rank += 1
        }
        
        while aliceIndex >= 0 {
            answer.append(rank)
            aliceIndex -= 1
        }
        
        return answer.reversed()
    }
}
