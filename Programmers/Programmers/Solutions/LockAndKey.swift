//
//  LockAndKey.swift
//  Programmers
//
//  Created by Chaewan Park on 2020/07/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class LockAndKey: Solution {
    func run() {
        assert(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]]) == true)
    }
    
    func solution(_ key: [[Int]], _ lock: [[Int]]) -> Bool {
        let paddedLock = addPadding(to: lock, size: key.count - 1)
        var rotatedKey = rotated(key: key)
        
        if matched(with: key, to: paddedLock) { return true }
        
        if matched(with: rotatedKey, to: paddedLock) { return true }
        
        rotatedKey = rotated(key: rotatedKey)
        if matched(with: rotatedKey, to: paddedLock) { return true }
        
        rotatedKey = rotated(key: rotatedKey)
        if matched(with: rotatedKey, to: paddedLock) { return true }
        
        return false
    }
    
    func rotated(key: [[Int]]) -> [[Int]] {
        var rotatedKey = Array(repeating: Array(repeating: 0, count: key.count), count: key.count)
        
        for row in 0..<key.count {
            for col in 0..<key.count {
                rotatedKey[col][key.count - row - 1] = key[row][col]
            }
        }
        return rotatedKey
    }
    
    func addPadding(to lock: [[Int]], size: Int) -> [[Int]] {
        let sizeOfMatrix = lock.count + size * 2
        var result = Array(repeating: Array(repeating: 0, count: sizeOfMatrix), count: sizeOfMatrix)
        
        for row in 0..<lock.count {
            for col in 0..<lock.count {
                result[row + size][col + size] = lock[row][col]
            }
        }
        return result
    }
    
    func matched(with key: [[Int]], to lock: [[Int]]) -> Bool {
        var sum = lock
        let padding = key.count - 1
        
        for row in 0..<lock.count - padding {
            for col in 0..<lock.count - padding {
                for keyRow in 0..<key.count {
                    for keyCol in 0..<key.count {
                        sum[row + keyRow][col + keyCol] += key[keyRow][keyCol]
                    }
                }
                if isLockFilled(sum, padding: padding) { return true }
                sum = lock
            }
        }
        return false
    }
    
    func isLockFilled(_ lock: [[Int]], padding: Int) -> Bool {
        for row in padding..<lock.count - padding {
            for col in padding..<lock.count - padding {
                if lock[row][col] != 1 { return false }
            }
        }
        return true
    }
}
