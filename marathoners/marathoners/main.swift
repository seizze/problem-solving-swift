//
//  main.swift
//  marathoners
//
//  Created by Chaewan Park on 2020/01/08.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

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
