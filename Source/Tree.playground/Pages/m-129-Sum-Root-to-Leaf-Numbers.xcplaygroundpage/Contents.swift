//: [Previous](@previous)

import Foundation

/// 129. 求根到叶子节点数字之和 中等
///
/// [url](https://leetcode-cn.com/problems/sum-root-to-leaf-numbers/)
///
/// 给定一个二叉树，它的每个结点都存放一个 0-9 的数字，每条从根到叶子节点的路径都代表一个数字。
///
/// 例如，从根到叶子节点路径 1->2->3 代表数字 123。
///
/// 计算从根到叶子节点生成的所有数字之和。
///
/// 说明: 叶子节点是指没有子节点的节点。
/// - Parameter root:
/// - Returns:
func sumNumbers(_ root: TreeNode?) -> Int {
    
    guard let root = root else { return 0 }
    
    var stack: [TreeNode] = []
    
    var sum = 0
    
    func recursion(_ node: TreeNode) {
        
        stack.append(node)
        
        var performAddition = true
        
        if let left = node.left {
            performAddition = false
            recursion(left)
        }
        
        if let right = node.right {
            performAddition = false
            recursion(right)
        }
        
        if performAddition {
            sum += _pow(with: stack)
        }
        
        stack = stack.dropLast()
    }
    
    recursion(root)
    
    return sum
}

func _pow(with stack: [TreeNode]) -> Int {
    
    var _sum = 0
    
    for i in 0 ..< stack.count {
        
        if i == stack.count - 1 {
            _sum += stack[i].val
            
        } else {
            
            let powValue = stack.count - 1 - i
            
            let multiple = NSDecimalNumber(decimal: pow(10, powValue)).intValue
            
            _sum += (multiple * stack[i].val)
        }
    }
    
    return _sum
}

func sumNumbers2(_ root: TreeNode?) -> Int {
    
    var total = 0
    
    func recurse(_ root: TreeNode?, _ sum: Int) {
        
        guard let root = root else { return }
        
        let current = sum * 10 + root.val
        
        if root.left == nil && root.right == nil {
            total += current
        }
        
        if let left  = root.left  { recurse(left,  current) }
        if let right = root.right { recurse(right, current) }
    }
    
    recurse(root, total)
    
    return total
}

// MARK: - Test

let test1 = TreeNode(1, TreeNode(2), TreeNode(3))

print(sumNumbers2(test1)) // 12 + 13 = 25

let test2 = TreeNode(9, TreeNode(5), TreeNode(1))
let test3 = TreeNode(4, test2, TreeNode(0))

print(sumNumbers2(test3)) // 495 + 491 + 40 = 1026

//: [Next](@next)
