//: [Previous](@previous)

import Foundation

/// 912. 排序数组 中等
///
/// [url](https://leetcode-cn.com/problems/sort-an-array/)
///
/// 给你一个整数数组 nums，请你将该数组升序排列。
///
/// - Parameter nums: 所需要排序的数组
/// - Returns: 排序好之后的数组
func sortArray(_ nums: [Int]) -> [Int] {
    return nums.sorted()
}

print(sortArray([5,2,3,1])) // [1,2,3,5]
print(sortArray([5,1,1,2,0,0])) // [0,0,1,1,2,5]

//: [Next](@next)
