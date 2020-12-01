//: [Previous](@previous)

import Foundation

/// 34. 在排序数组中查找元素的第一个和最后一个位置 中等
///
/// [url](https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/)
///
/// 给定一个按照升序排列的整数数组 `nums`，和一个目标值 `target`。
/// 找出给定目标值在数组中的开始位置和结束位置。
///
/// 如果数组中不存在目标值 `target`，返回 `[-1, -1]`。
///
/// - Parameters:
///   - nums:
///   - target:
/// - Returns:
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    
    guard !nums.isEmpty else { return [-1,-1] }
    
    guard nums.count > 1 else {
        return nums[0] == target ? [0, 0] : [-1, -1]
    }
    
    var start = -1
    var end = -1
    
    for i in 0 ..< nums.count {
        
        let num = nums[i]
        
        if num == target {
            
            if start == -1 {
                start = i
                end = i
            } else {
                end = i
            }
        }
        
        if num > target { break }
    }
    
    return [start, end]
}

/// 尝试使用二分法实现
func searchRange1(_ nums: [Int], _ target: Int) -> [Int] {
    
    var result = [-1,-1]
    
    // base case
    if nums.count == 0 { return result }
    
    var low = 0
    var high = nums.count - 1
    
    // finding left point
    while low < high {
        
        let mid = (low + high) / 2
        
        if nums[mid] < target {
            low = mid + 1
        } else {
            high = mid
        }
    }
    
    if nums[low] != target { return result }
    
    result[0] = low
    
    // find right end
    high = nums.count - 1
    
    while low < high {
        
        let mid = (low + high) / 2 + 1
        
        if nums[mid] > target {
            high = mid - 1
        } else {
            low = mid
        }
    }
    
    result[1] = high
    
    return result
}

print(searchRange1([5,7,7,8,8,10], 8)) // [3,4]
print(searchRange1([5,7,7,8,8,10], 6)) // [-1,-1]
print(searchRange1([1,3], 1)) // [0,0]
print(searchRange1([], 0)) // [-1,-1]

//: [Next](@next)
