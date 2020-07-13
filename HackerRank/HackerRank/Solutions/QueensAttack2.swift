//
//  QueensAttack2.swift
//  HackerRank
//
//  Created by Chaewan Park on 2020/07/14.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class QueensAttack2: Solution {
    func run() {
        queensAttack(n: 5, k: 3, r_q: 4, c_q: 3, obstacles: [[5, 5], [4, 2], [2, 3]])
    }
    
    struct Position {
        var row: Int
        var col: Int
    }
    
    enum Orientation: CaseIterable {
        case r, ru, u, lu, l, ld, d, rd
        
        func isMatched(_ r: Int, _ c: Int) -> Bool {
            switch self {
            case .r: if r == 0 && c > 0 { return true }
            case .ru: if r > 0 && c > 0 && r == c { return true }
            case .u: if r > 0 && c == 0 { return true }
            case .lu: if r > 0 && c < 0 && r == abs(c) { return true }
            case .l: if r == 0 && c < 0 { return true }
            case .ld: if r < 0 && c < 0 && r == c { return true }
            case .d: if r < 0 && c == 0 { return true }
            case .rd: if r < 0 && c > 0 && abs(r) == c { return true }
            }
            return false
        }
        
        func attacksIn(_ r: Int, _ c: Int) -> Int {
            switch self {
            case .ru, .u, .lu: return r - 1
            case .r, .rd: return c - 1
            case .d, .ld: return abs(r) - 1
            case .l: return abs(c) - 1
            }
        }
        
        func move(_ position: inout Position) {
            switch self {
            case .ru, .u, .lu: position.row += 1
            default: break
            }
            switch self {
            case .ld, .d, .rd: position.row -= 1
            default: break
            }
            switch self {
            case .r, .ru, .rd: position.col += 1
            default: break
            }
            switch self {
            case .lu, .l, .ld: position.col -= 1
            default: break
            }
        }
    }
    
    func queensAttack(n: Int, k: Int, r_q: Int, c_q: Int, obstacles: [[Int]]) {
        var attacks = 0
        
        Orientation.allCases.forEach {
            attacks += distanceToObstacle(in: obstacles, queen: Position(row: r_q, col: c_q), orientation: $0, max: n)
        }
        
        print(attacks)
    }
    
    func distanceToObstacle(in obstacles: [[Int]], queen: Position, orientation: Orientation, max: Int) -> Int {
        var minAttacks = maxAttacks(from: queen, orientation: orientation, max: max)
        
        for obstacle in obstacles {
            let row = obstacle[0] - queen.row
            let col = obstacle[1] - queen.col
            if orientation.isMatched(row, col) {
                let attacks = orientation.attacksIn(row, col)
                minAttacks = min(minAttacks, attacks)
            }
        }
        return minAttacks
    }
    
    func maxAttacks(from queen: Position, orientation: Orientation, max: Int) -> Int {
        var count = 0
        var position = queen
        
        while true {
            orientation.move(&position)
            guard position.row > 0 && position.row <= max && position.col > 0 && position.col <= max else { return count }
            count += 1
        }
    }
}
