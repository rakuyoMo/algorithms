//: [上一道题](@previous)
/*:
 # 排序数组
 
 - 题号：[912](https://leetcode-cn.com/problems/sort-an-array/)
 - 难度：中等
 - 描述：
 
    给你一个整数数组 `nums`，请你将该数组升序排列。
 */

//: ## Code
import Foundation

func sortArray(_ nums: [Int]) -> [Int] {
    return nums.sorted()
}

//: ## Test
print(sortArray([5,2,3,1])) // [1,2,3,5]
print(sortArray([5,1,1,2,0,0])) // [0,0,1,1,2,5]

//: [下一道题](@next)
