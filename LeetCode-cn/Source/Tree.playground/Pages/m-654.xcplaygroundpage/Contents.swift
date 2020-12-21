//: [上一道题](@previous)
/*:
 # 最大二叉树
 
 - 题号：[654](https://leetcode-cn.com/problems/maximum-binary-tree/)
 - 难度：中等
 - 描述：
    
    给定一个不含重复元素的整数数组。一个以此数组构建的最大二叉树定义如下：
        1. 二叉树的根是数组中的最大元素。
        2. 左子树是通过数组中最大值左边部分构造出的最大二叉树。
        3. 右子树是通过数组中最大值右边部分构造出的最大二叉树。
    
    通过给定的数组构建最大二叉树，并且输出这个树的根节点。
 */

//: ## Code
import Foundation

func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
    
    func _traverse(_ nums: [Int]) -> TreeNode? {
        
        guard !nums.isEmpty else { return nil }
        
        // 寻找目标范围
        func _find(_ _nums: [Int]) -> (max: Int, left: [Int], right: [Int]) {
            
            var maxIndex = 0
            var max = 0
            
            for i in 0 ..< _nums.count {
                
                let num = _nums[i]
                
                if num > max {
                    max = num
                    maxIndex = i
                }
            }
            
            return (max, Array(_nums[0 ..< maxIndex]), Array(_nums[maxIndex + 1 ..< _nums.count]))
        }
        
        let (max, left, right) = _find(nums)
        
        let node = TreeNode(max)
        
        node.left = _traverse(left)
        node.right = _traverse(right)
        
        return node
    }
    
    return _traverse(nums)
}

print(constructMaximumBinaryTree([3,2,1,6,0,5]) as Any) // [6,3,5,null,2,0,null,null,1]

//: [下一道题](@next)
