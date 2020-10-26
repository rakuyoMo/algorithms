//: [Previous](@previous)

import Foundation

/// 104. 二叉树的最大深度 简单
///
/// [url](https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/)
///
/// 给定一个二叉树，找出其最大深度。
///
/// 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
///
/// 说明: 叶子节点是指没有子节点的节点。
///
/// - Parameter root:
/// - Returns:
func maxDepth(_ root: TreeNode?) -> Int {
    return root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1
}

let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)

root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

print(maxDepth(root))

//: [Next](@next)