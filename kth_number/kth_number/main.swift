//
//  main.swift
//  kth_number
//
//  Created by Chaewan Park on 2020/01/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map { findKthNumber(array, $0) }
}

func findKthNumber(_ array: [Int], _ command: [Int]) -> Int {
    let subArray = array[(command[0] - 1)...(command[1] - 1)].sorted()
    return subArray[command[2] - 1]
}
