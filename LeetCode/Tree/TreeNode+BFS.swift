//
//  TreeNode+BFS.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/4/13.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

// MARK: BFS

extension TreeNode {
    
    /// 使用数组，以广度优先 的顺序创建二叉树
    /// 
    /// - Parameter vals: 二叉树数组
    convenience init?(bfs vals: [Int?]) {
        
        guard !vals.isEmpty else { return nil }
        
        var vals = vals
        
        guard let first = vals.removeFirst() else { 
            return nil 
        }
        
        self.init(first)
        
        var stack: [TreeNode] = [self]
        
        while !stack.isEmpty {
            
            let node = stack.removeFirst()
            
            if !vals.isEmpty, let value = vals.removeFirst() {
                node.left = TreeNode(value) 
                stack.append(node.left!)
            }
            
            if !vals.isEmpty, let value = vals.removeFirst() {
                node.right = TreeNode(value) 
                stack.append(node.right!)
            }
        }
    }
    
    /// 以广度优先遍历的方式将二叉树转换为字符串
    var bfsDescription: String {
        
        var result: [[Int]] = [[val]]
        var stack: [TreeNode] = [self]
        
        // 每一层的目标数量
        var count = stack.count * 2
        var tmp: [Int] = []
        
        while !stack.isEmpty {
            
            let node = stack.removeFirst()
            
            if let left = node.left {
                tmp.append(left.val)
                stack.append(left)
            } else {
                tmp.append(-1)
            }
            
            if let right = node.right {
                tmp.append(right.val)
                stack.append(right)
            } else {
                tmp.append(-1)
            }
            
            if tmp.count == count {
                result.append(tmp)
                
                count *= 2
                tmp = []
            }
        }
        
        var string = result.description
        
        string.removeFirst()
        string.removeLast()
        
        string = string.replacingOccurrences(of: "], ", with: "]\n")
        string = string.replacingOccurrences(of: "-1", with: "nil")
        
        return string
    }
}