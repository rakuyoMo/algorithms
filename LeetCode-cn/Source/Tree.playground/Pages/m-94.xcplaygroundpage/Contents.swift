/*:
 # 二叉树的中序遍历
 
 - 题号：[94](https://leetcode-cn.com/problems/binary-tree-inorder-traversal/)
 - 难度：中等
 - 描述：
 
    给定一个二叉树的根节点 `root`，返回它的**中序**遍历。
 */

//: ## Code
import Foundation

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    
    var result: [Int] = []
    
    func _traverse(_ node: TreeNode?) {
        
        guard let node = node else { return }
        
        _traverse(node.left)
        result.append(node.val)
        _traverse(node.right)
    }
    
    _traverse(root)
    
    return result
}

//: ## Test
let node = TreeNode(1)
node.right = TreeNode(2)
node.right?.left = TreeNode(3)

print(inorderTraversal(node)) // [1,3,2]

//: [下一道题](@next)
