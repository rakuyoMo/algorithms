//
//  TreeNode.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/3/26.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

/// Definition for a binary tree node.
class TreeNode {
    
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

extension TreeNode: Equatable {
    
    static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }
}