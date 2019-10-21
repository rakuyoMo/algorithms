//: [Previous](@previous)
/*:
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
 
 你可以假设数组中无重复元素。
 
 示例 1:
 
 输入: [1,3,5,6], 5
 输出: 2
 示例 2:
 
 输入: [1,3,5,6], 2
 输出: 1
 示例 3:
 
 输入: [1,3,5,6], 7
 输出: 4
 示例 4:
 
 输入: [1,3,5,6], 0
 输出: 0
 */
import Foundation

// 测试用例
let testOne = (array : [1, 3, 5, 6], tager : 5)  // 2
let testTwo = (array : [1, 3, 5, 6], tager : 2)  // 1
let testThr = (array : [1, 3, 5, 6], tager : 7)  // 4
let testFou = (array : [1, 3, 5, 6], tager : 0)  // 0

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if nums.isEmpty { return 0 }
    
    if nums.last! < target { return nums.count }
    
    for (index, value) in nums.enumerated() {
        if value == target || value > target {
            return index
        }
    }
    
    return 0
}

searchInsert(testOne.array, testOne.tager)  // 2
searchInsert(testTwo.array, testTwo.tager)  // 1
searchInsert(testThr.array, testThr.tager)  // 4
searchInsert(testFou.array, testFou.tager)  // 0

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */
/*:
 **LeetCode 最速解答**
 */
func searchInsert2(_ nums: [Int], _ target: Int) -> Int {
    for i in 0 ..< nums.count { if target <= nums[i] { return i } }
    return nums.count
}

searchInsert2(testOne.array, testOne.tager)  // 2
searchInsert2(testTwo.array, testTwo.tager)  // 1
searchInsert2(testThr.array, testThr.tager)  // 4
searchInsert2(testFou.array, testFou.tager)  // 0

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */
/*:
 ** LeetCode 二分法解答 **
 */
func searchInsert3(_ nums: [Int], _ target: Int) -> Int {
    
    var low = 0
    var high = nums.count - 1
    var mid = 0
    
    // 一个元素 直接比较
    if low == high { return (nums[0] < target) ? 1 : 0; }
    
    while low <= high {
        mid = (low + high) / 2
        
        // 不等于，或者在两边的数中间
        if nums[mid] == target || (mid != 0 && nums[mid] > target && nums[mid - 1] < target) {
            return mid
        }
        
        // 向中间汇聚
        if nums[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    // 判断到了末尾
    return (mid == nums.count - 1) ? (mid + 1) : mid
}

searchInsert3(testOne.array, testOne.tager)  // 2
searchInsert3(testTwo.array, testTwo.tager)  // 1
searchInsert3(testThr.array, testThr.tager)  // 4
searchInsert3(testFou.array, testFou.tager)  // 0

//: [Next](@next)
