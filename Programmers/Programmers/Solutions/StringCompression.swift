//
//  StringCompression.swift
//  Programmers
//
//  Created by Chaewan Park on 2020/07/09.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class StringCompression: Solution {
    func run() {
        assert(solution("a") == 1)
        assert(solution("abcdefghijklmnopqrstuvwxyz") == "abcdefghijklmnopqrstuvwxyz".count)
        assert(solution("abcabcabcabc") == 4)
        assert(solution("aabb") == 4)
        assert(solution("aabbaccc") == 7)
        assert(solution("ababcdcdababcdcd") == 9)
        assert(solution("abcabcdede") == 8)
        assert(solution("abcabcabcabcdededededede") == 14)
        assert(solution("xababcdcdababcdcd") == 17)
        assert(solution("aaaaaaaaaabbb") == 5)
    }
    
    func solution(_ s: String) -> Int {
        let buffer = s.map { $0 }
        var minimumLength = s.count
        let maxCompressionUnit = s.count / 2 < 1 ? 1 : s.count / 2
        
        for compressionUnit in 1...maxCompressionUnit {
            var index = 0
            var lastString = [String]()
            var compressionLength = 0
            var compressionCount = 0
            
            while index + compressionUnit <= buffer.count {
                let subString = buffer[index..<index + compressionUnit].map { String($0) }
                
                if subString == lastString {
                    compressionCount += 1
                } else {
                    if compressionCount > 0 {
                        compressionLength += "\(compressionCount + 1)".count
                    }
                    compressionLength += compressionUnit
                    compressionCount = 0
                }
                
                lastString = subString
                index += compressionUnit
            }
            
            if compressionCount > 0 {
                compressionLength += "\(compressionCount + 1)".count
            }
            
            if index < buffer.count {
                compressionLength += buffer[index...].count
            }
            
            if compressionLength < minimumLength {
                minimumLength = compressionLength
            }
        }
        return minimumLength
    }
}
