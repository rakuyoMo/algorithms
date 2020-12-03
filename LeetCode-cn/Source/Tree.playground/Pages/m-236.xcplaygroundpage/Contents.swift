//: [上一道题](@previous)
/*:
 # 二叉树的最近公共祖先
 
 - 题号：[236](https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/)
 - 难度：中等
 - 描述：
 
    给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
    
    百度百科中最近公共祖先的定义为：
        “对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，
        满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
 */

//: ## Code
import Foundation

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    var result: TreeNode? = nil
    
    // 遍历树
    recurseTree(root, p, q, &result);
    
    return result
}

func recurseTree(_ currentNode: TreeNode?, _ p: TreeNode?, _ q: TreeNode?, _ result: inout TreeNode?) -> Bool {
    
    // 如果到达分支的末尾，则返回 false
    guard let currentNode = currentNode else {
        return false
    }

    let left = recurseTree(currentNode.left, p, q, &result) ? 1 : 0
    let right = recurseTree(currentNode.right, p, q, &result) ? 1 : 0
    let mid = (currentNode == p || currentNode == q) ? 1 : 0

    if mid + left + right >= 2 {
        result = currentNode
    }

    return mid + left + right > 0
}

//: ## Test
//if let dfs = TreeNode(dfs: [1,2,3,4,nil,nil,5,nil,nil,nil,6,7,nil,8,nil,nil,9]) {
//    print(dfs.bfsDescription)
//    print(dfs.dfsDescription)
//}
//
//print("------------------------------------------------")
//
//if let bfs = TreeNode(bfs: [3,5,1,6,2,0,8,nil,nil,7,4]) {
//    print(bfs.bfsDescription)
//    print(bfs.dfsDescription)
//}

//: [下一道题](@next)
