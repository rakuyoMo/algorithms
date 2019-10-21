import Foundation

/**
 *  题目：
 *
 *  给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
 *
 *  你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
 *
 *  示例：
 *
 *  给定 nums = [2, 7, 11, 15], target = 9
 *
 *  因为 nums[0] + nums[1] = 2 + 7 = 9
 *  所以返回 [0, 1]
 */
class Solution {
    
    /* 测试用例 */
    let nums = [12, 7, 11, 2, 5, 9]
    let target = 23
}

// MARK: - 穷举遍历法

extension Solution {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        for index in 0 ..< nums.count {
            
            let numOne = nums[index]
            
            for otherIndex in index + 1 ..< nums.count {
                
                let numTwo = nums[otherIndex]
                
                if (numOne + numTwo) != target { continue }
                
                return [index, otherIndex]
            }
        }
        
        return [0]
    }
    
    func runTest() {
        twoSum(nums, target)
    }
}

Solution().runTest()

// MARK: - 最佳解答

/**
 *  使用一个字典来存储数据。以 数组中的内容为 Key，以 索引 为为 Value
 */
extension Solution {
    
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {

        var map = [Int: Int]()

        for i in 0 ..< nums.count {

            if let num = map[target - nums[i]] {
                return [i, num]
            }
            
            map.updateValue(i, forKey: nums[i])
        }
        
        return []
    }
    
    func runTest2() {
        twoSum2(nums, target)
    }
}

Solution().runTest()

//: [Next](@next)
