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
    
    /// 使用数组，以深度优先的顺序创建二叉树
    init?(dfs vals: [Int?]) {
        
        var index = 0
        
        func preCreateTree(_ tree: inout TreeNode?) {
            
            if index > vals.count - 1 { return }
            
            let value = vals[index]
            
            index += 1
            
            if let value = value {
                
                // 生成根结点
                tree = TreeNode(value)
                
                // 构造左子树
                preCreateTree(&tree!.left)
                
                // 构造右子树
                preCreateTree(&tree!.right)
                
            } else {
                tree = nil
            }
        }
        
        var root: TreeNode? = nil
        
        preCreateTree(&root)
        
        guard let result = root else { return nil }
        
        self.val = result.val
        self.left = result.left
        self.right = result.right
    }
}