//
//  main.swift
//  tree_traversal
//
//  Created by Chaewan Park on 2020/01/29.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

indirect enum Tree<T> {
    case node(Tree<T>, T, Tree<T>)
    case empty
}

extension Tree {
    var preorder: String {
        if case let .node(left, value, right) = self {
            return "\(value)\(left.preorder)\(right.preorder)"
        } else {
            return ""
        }
    }
    
    var inorder: String {
        if case let .node(left, value, right) = self {
            return "\(left.inorder)\(value)\(right.inorder)"
        }
        return ""
    }
    
    var postorder: String {
        if case let .node(left, value, right) = self {
            return "\(left.postorder)\(right.postorder)\(value)"
        } else {
            return ""
        }
    }
}

var nodeDictionary = Dictionary<String, [String]>()

func constructDictionary() {
    let numOfNode = Int(readLine()!)!
    let subTrees = (0..<numOfNode).map { _ in readLine()! }.map { (subTree) -> (String, [String]) in
        let subStrings = subTree.split(separator: " ")
        return (String(subStrings[0]), [String(subStrings[1]), String(subStrings[2])])
    }
    nodeDictionary = Dictionary(uniqueKeysWithValues: subTrees)
}

func constructTree(with value: String) -> Tree<String> {
    let node = nodeDictionary[value]!
    let left = node[0] == "." ? Tree.empty : constructTree(with: node[0])
    let right = node[1] == "." ? Tree.empty : constructTree(with: node[1])
    return Tree.node(left, value, right)
}

constructDictionary()
let tree = constructTree(with: "A")

print(tree.preorder)
print(tree.inorder)
print(tree.postorder)
