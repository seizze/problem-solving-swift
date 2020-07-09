//
//  SparseArrays.swift
//  HackerRank
//
//  Created by Chaewan Park on 2020/07/09.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class SparseArrays: Solution {
    func run() {
        matchingStrings(strings: ["aba", "baba", "aba", "xzxb"], queries: ["aba", "xzxb", "ab"])
    }
    
    func matchingStrings(strings: [String], queries: [String]) {
        let labeled = zip(strings, Array(repeating: 1, count: strings.count))
        let hashed = Dictionary().merging(labeled, uniquingKeysWith: +)
        
        queries.forEach { query in
            if let count = hashed[query] {
                print(count)
            } else {
                print(0)
            }
        }
    }
}
