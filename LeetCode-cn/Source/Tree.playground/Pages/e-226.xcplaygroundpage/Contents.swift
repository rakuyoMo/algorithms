/*:
 # 翻转二叉树
 
 - 题号：[226](https://leetcode-cn.com/problems/invert-binary-tree/)
 - 难度：简单
 - 描述：
 
    翻转一棵二叉树。
 */

//: ## Code
import Foundation

func invertTree(_ root: TreeNode?) -> TreeNode? {
    
    /* 翻转二叉树实际上就是交换左右子树 */
    
    func _traverse(_ node: TreeNode?) {
        
        guard let node = node else  { return }
        
        // 这里无论采用三种遍历的哪种进行交换都是可以的
        (node.left, node.right) = (node.right, node.left)
        
        _traverse(node.left)
        _traverse(node.right)
    }
    
    _traverse(root)
    
    return root
}

//: ## Test


//: [下一道题](@next)
