//: [上一道题](@previous)
/*:
 # 有多少小于当前数字的数字
 
 - 题号：[1365](https://https://leetcode-cn.com/problems/how-many-numbers-are-smaller-than-the-current-number/)
 - 难度：简单
 - 描述：
 
     给你一个数组 `nums`，对于其中每个元素 `nums[i]`，请你统计数组中比它小的所有数字的数目。
     
     换而言之，对于每个 `nums[i]` 你必须计算出有效的 `j` 的数量，其中 `j` 满足 `j != i` 且 `nums[j] < nums[i]`。
     
     以数组形式返回答案。
 */

//: ## Code
import Foundation

func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    
    var result: [Int] = []
    
    for i in nums {
        
        var count = 0
        
        for j in nums {
            guard i != j else { continue }
            
            if j < i {
                count += 1
            }
        }
        
        result.append(count)
    }
    
    return result
}

/// 借助桶实现
func smallerNumbersThanCurrent2(_ nums: [Int]) -> [Int] {
    
    // 定义桶 `counter`
    //
    // 因题目提到 `0 <= nums[i] <= 100`。故 counter 的最大长度定为 101 即可
    var counter = [Int](repeating: 0, count: 101)
    
    // 遍历 `nums`，并使用 `counter` 存储 `k` 出现的次数
    //
    // `counter[k]` 代表 `nums[i]` 出现的次数
    for k in nums {
        counter[k] += 1
    }
    
    // 因为桶实际上代表着 “已经排过序了”，且是由小到大排序。
    //
    // 所以累加桶里的值，即可得到比 `i` 小的数字的个数。
    //
    // 更通俗的讲，假如 counter 此时是 [0, 1, 2, 1]。
    // `counter[2]` 的值代表 `nums` 里的元素 `2`，出现了2次，即 nums 里有2个 `2`。
    // `counter[3]` 的值代表 `nums` 里的元素 `3`，出现了1次，即 nums 里有1个 `3`。
    //
    // 这么说的话，`counter[2] + counter[3]` 就可以理解为：
    // 小于等于 `3` 的元素的个数一共为 `2 + 1 = 3` 个。
    //
    // 所以此时 `counter[i]` 的含义为：
    // 在 `nums` 中，小于等于值为 `i` 的元素的个数为 `counter[i]` 个。
    for i in 1 ..< counter.count {
        counter[i] += counter[i - 1]
    }
    
    var ans = nums
    
    // 最后遍历 `nums`，取出对应的个数，组装成目标数组即可
    for (i, k) in nums.enumerated() {
        
        // 因为题目的要求是 “小于”。而 `counter[k]` 是小于等于。故需要 `k - 1`，排除掉自身的个数。
        ans[i] = k == 0 ? 0 : counter[k - 1]
    }
    
    return ans
}

//: ## Test
print(smallerNumbersThanCurrent2([8,1,2,2,3])) // [4,0,1,1,3]
print(smallerNumbersThanCurrent2([6,5,4,8]))   // [2,1,0,3]
print(smallerNumbersThanCurrent2([7,7,7,7]))   // [0,0,0,0]

//: [下一道题](@next)
