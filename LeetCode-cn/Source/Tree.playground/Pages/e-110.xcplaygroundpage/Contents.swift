//: [上一道题](@previous)
/*:
 # 平衡二叉树
 
 - 题号：[110](https://leetcode-cn.com/problems/balanced-binary-tree/)
 - 难度：简单
 - 描述：
 
    给定一个二叉树，判断它是否是高度平衡的二叉树。
    
    本题中，一棵高度平衡二叉树定义为：
        > 一个二叉树*每个节点*的左右两个子树的高度差的绝对值不超过 1 。
 */

//: ## Code
import Foundation

func isBalanced(_ root: TreeNode?) -> Bool {
    
    /* 算每个节点，左子树和右子树的高度，然后对于高度，套用题目的要求做计算。 */
    
    func _height(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        return 1 + max(_height(node.left), _height(node.right))
    }
    
    func _traverse(_ node: TreeNode?) -> Bool {
        
        guard let node = node else { return true }
        
        guard abs(_height(node.left) - _height(node.right)) <= 1 else {
            return false
        }
        
        return _traverse(node.left) && _traverse(node.right)
    }
    
    return _traverse(root)
}

//: ## Test
let root1 = TreeNode(3)
root1.left = TreeNode(9)
root1.right = TreeNode(20)
root1.right?.left = TreeNode(15)
root1.right?.right = TreeNode(7)

print(isBalanced(root1)) // true

let root2 = TreeNode(1)
root2.left = TreeNode(2)
root2.right = TreeNode(2)
root2.left?.left = TreeNode(3)
root2.left?.right = TreeNode(3)
root2.left?.left?.left = TreeNode(4)
root2.left?.left?.right = TreeNode(4)

print(isBalanced(root2)) // false

let root3 = TreeNode(1)
root3.left = TreeNode(2)
root3.right = TreeNode(2)
root3.left?.left = TreeNode(3)

//: [下一道题](@next)
