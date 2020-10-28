//: [Previous](@previous)

import Foundation

/// 144. 二叉树的前序遍历 中等
///
/// [url](https://leetcode-cn.com/problems/binary-tree-preorder-traversal/)
///
/// 给定一个二叉树，返回它的 *前序* 遍历。
///
/// - Parameter root:
/// - Returns:
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    
    guard let root = root else { return [] }
    
    var result: [Int] = []
    
    func _preorderTraversal(_ kRoot: TreeNode) {
        
        // 前序遍历：根左右
        result.append(kRoot.val)
        
        if let left = kRoot.left {
            _preorderTraversal(left)
        }
        
        if let right = kRoot.right {
            _preorderTraversal(right)
        }
    }
    
    _preorderTraversal(root)
    
    return result
}

// 使用迭代实现
func preorderTraversal2(_ root: TreeNode?) -> [Int] {
    
    guard let root = root else { return [] }
    
    var result: [Int] = []
    
    // 借助一个额外的栈
    var tmp: [TreeNode] = [root]
    
    while let target = tmp.popLast() {
        
        result.append(target.val)
        
        if let right = target.right {
            tmp.append(right)
        }
        
        if let left = target.left {
            tmp.append(left)
        }
    }
    
    return result
}

let node3 = TreeNode(3)
let node2 = TreeNode(2, node3, nil)
let node1 = TreeNode(1, nil, node2)

print(preorderTraversal2(node1))

enum Test: String {
    
    case a = ""
}


//: [Next](@next)
