//
//  Marathoners.swift
//  Programmers
//
//  Created by Chaewan Park on 2020/07/09.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Marathoners: Solution {
    func run() {
        assert(solution(["leo", "kiki", "eden"], ["eden", "kiki"]) == "leo")
        assert(solution(["marina", "josipa", "nikola", "vinko", "filipa"], ["josipa", "filipa", "marina", "nikola"]) == "vinko")
        assert(solution(["mislav", "stanko", "mislav", "ana"], ["stanko", "ana", "mislav"]) == "mislav")
    }
    
    func solution(_ participant: [String], _ completion: [String]) -> String {
        let labeled = zip(participant, Array(repeating: 1, count: participant.count))
        
        var hashed = Dictionary().merging(labeled, uniquingKeysWith: +)
        
        completion.forEach { finisher in
            let value = hashed[finisher]!
            hashed.updateValue(value - 1, forKey: finisher)
        }
        
        hashed = hashed.filter { $0.value != 0 }
        return hashed.keys.first!
    }
}
