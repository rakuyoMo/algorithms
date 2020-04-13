//
//  TreeNode+DFS.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/4/13.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

// MARK: DFS

extension TreeNode {
    
    /// 使用数组，以深度优先 + 先序遍历 的顺序创建二叉树
    /// 
    /// 遇到 nil 则开始构造右子树，否则将一直构造左子树
    /// 
    /// - Parameter vals: 二叉树数组
    convenience init?(dfs vals: [Int?]) {
        
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
        
        self.init(0)
        
        var root: TreeNode? = self
        
        preCreateTree(&root)
        
        guard let result = root else { return nil }
        
        self.val = result.val
        self.left = result.left
        self.right = result.right
    }
    
    /// 以深度优先遍历的方式将二叉树转换为字符串
    var dfsDescription: String {
        
        var result: [[Int]] = []
        
        dfs(self, level: 0, result: &result)
        
        var string = result.description
        
        string.removeFirst()
        string.removeLast()
        
        string = string.replacingOccurrences(of: "], ", with: "]\n")
        string = string.replacingOccurrences(of: "-1", with: "nil")
        
        return string
    }
    
    /// 深度优先遍历
    private func dfs(_ node: TreeNode, level: Int, result: inout [[Int]]) {
        
        // 当前节点
        append(val: node.val, level: level, result: &result)
        
        // 遍历下一层
        let level = level + 1
        
        // 左子树
        if let left = node.left {
            dfs(left, level: level, result: &result)
        } else {
            
            // 为了打印，故对于 nil 的子树，添加 -1，表示 nil
            append(val: -1, level: level, result: &result)
        }
        
        // 右子树
        if let right = node.right {
            dfs(right, level: level, result: &result)
        } else {
            
            // 为了打印，故对于 nil 的子树，添加 -1，表示 nil
            append(val: -1, level: level, result: &result)
        }
    }
    
    // 将值添加到 `result` 中
    private func append(val: Int, level: Int, result: inout [[Int]]) {
        
        if result.count == level {
            result.append([val])
            
        } else {
            var tmp = result[level]
            tmp.append(val)
            result[level] = tmp
        }
    }
}
