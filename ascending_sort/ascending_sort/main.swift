//
//  main.swift
//  ascending_sort
//
//  Created by Chaewan Park on 2020/01/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

let length = Int(readLine()!)!
var sortingTable = Array(repeating: "", count: 10001)

for _ in 0..<length {
    let input = Int(readLine()!)!
    sortingTable[input] += "\(input)\n"
}

let output = sortingTable.joined()

print(output)
