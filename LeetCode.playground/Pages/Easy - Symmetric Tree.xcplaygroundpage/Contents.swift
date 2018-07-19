//: [Previous](@previous)
/*:
 给定一个二叉树，检查它是否是镜像对称的。
 
 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
 
     1
    / \
   2   2
  / \ / \
 3  4 4  3
 
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
 
     1
    / \
   2   2
    \   \
     3    3
 
 说明: 如果你可以运用递归和迭代两种方法解决这个问题，会很加分。
 */
import Foundation

/// Definition for a binary tree node.
public class TreeNode {
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

// 测试用例
func createTestTree(fromArray:[Int?]) -> TreeNode {
    
    func createTree(_ fromArray:[Int?], _ node:Int, _ index:Int) -> TreeNode {
        
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

    return createTree(fromArray, fromArray.first!!, 0)
}

let testOne = createTestTree(fromArray: [1, 2, 2, 3, 4, 4, 3])
let testTwo = createTestTree(fromArray: [1, 2, 2, nil, 3, nil, 3])

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */

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

isSymmetric(testOne)
isSymmetric(testTwo)

//: [Next](@next)
