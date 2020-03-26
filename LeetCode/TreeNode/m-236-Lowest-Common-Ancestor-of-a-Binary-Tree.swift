//
//  m-236-Lowest-Common-Ancestor-of-a-Binary-Tree.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/3/26.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

extension Solution {

    /// 236. 二叉树的最近公共祖先 中等
    /// 
    /// 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
    ///
    /// 百度百科中最近公共祖先的定义为：
    /// “对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，
    /// 满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
    /// 
    /// - Parameters:
    ///   - root: 二叉树
    ///   - p: 节点1
    ///   - q: 节点2
    /// - Returns: 最近公共祖先
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        
        
        
        
        return nil
    }
    
    func _236() {
        
        let node = TreeNode(preOrder: [3,5,1,6,2,0,8,nil,nil,7,4])
        
        print(node?.val)
        print(node?.left?.val)
        print(node?.right?.val)
    }
}