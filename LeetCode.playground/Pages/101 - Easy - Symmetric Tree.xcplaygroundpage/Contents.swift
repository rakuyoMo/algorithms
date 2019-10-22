//: [Previous](@previous)

import Foundation

/**
 *  - 题目：
 *
 *  给定一个二叉树，检查它是否是镜像对称的。
 *
 *  - 示例：
 *
 *  1. 二叉树 [1,2,2,3,4,4,3] 是对称的。
 *
 *      1
 *     / \
 *    2   2
 *   / \ / \
 *  3  4 4  3
 *
 *  2. 二叉树 [1,2,2,null,3,null,3] 则不是镜像对称的:
 *
 *      1
 *     / \
 *    2   2
 *     \   \
 *      3    3
 *
 *  - 说明:
 *
 *  如果你可以运用递归和迭代两种方法解决这个问题，会很加分。
 */

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
    
    static func createTree(from array: [Int?]) -> TreeNode {
        
        func createTree(_ fromArray: [Int?], _ node: Int, _ index: Int) -> TreeNode {
            
            let tree = TreeNode(node)
            
            let tmpLeftIndex = 2 * index + 1
            let tmpRightIndex = 2 * index + 2
            
            if tmpLeftIndex > fromArray.count || tmpRightIndex > fromArray.count {
                return tree
            }
            
            if let tmpNode = fromArray[tmpLeftIndex] {
                tree.left = createTree(fromArray, tmpNode, tmpLeftIndex)
            }
            
            if let tmpNode = fromArray[tmpRightIndex] {
                tree.right = createTree(fromArray, tmpNode, tmpRightIndex)
            }

            return tree
        }

        return createTree(array, array.first!!, 0)
    }
}

class Solution {

    /* 测试用例 */
    let testOne = TreeNode.createTree(from: [1, 2, 2, 3, 4, 4, 3])     // true
    let testTwo = TreeNode.createTree(from: [1, 2, 2, nil, 3, nil, 3]) // false
}

// MARK: -

extension Solution {
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return equalNodes(root?.left, root?.right)
    }
    
    func equalNodes(_ nodeOne: TreeNode?, _ nodeTwo: TreeNode?) -> Bool {

        if nodeOne == nil && nodeTwo == nil {
            return true
        }
        
        if nodeOne?.val == nodeTwo?.val {
            return equalNodes(nodeOne?.left, nodeTwo?.right)
                && equalNodes(nodeOne?.right, nodeTwo?.left)
        }
        
        return false
    }
    
    func runTest() {
        
        isSymmetric(testOne)
        isSymmetric(testTwo)
    }
}

Solution().runTest()

//: [Next](@next)
