//
//  main.swift
//  ascending_sort
//
//  Created by Chaewan Park on 2020/01/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

let length = Int(readLine()!)!
var sortingTable = Array(repeating: 0, count: 10001)

for _ in 0..<length {
    let input = Int(readLine()!)!
    sortingTable[input] += 1
}

let output = (1...10000)
    .map { Array(repeating: "\($0)\n", count: sortingTable[$0]).joined() }
    .reduce("", +)

print(output)
