//: [上一道题](@previous)
/*:
 # 两个数组的交集
 
 - 题号：[1207](https://leetcode-cn.com/problems/unique-number-of-occurrences/)
 - 难度：简单
 - 描述：
 
    给你一个整数数组 `arr`，请你帮忙统计数组中每个数的出现次数。
    
    如果每个数的出现次数都是独一无二的，就返回 `true`；否则返回 `false`。
 */

//: ## Code
import Foundation

func uniqueOccurrences(_ arr: [Int]) -> Bool {
    
    var table: [Int : Int] = [:]
    
    for value in arr {
        table[value] = (table[value] ?? 0) + 1
    }
    
    let values = table.values
    
    return Set(values).count == values.count
}

//: ## Test
print(uniqueOccurrences([1,2])) // false
print(uniqueOccurrences([1,2,2,1,1,3])) // true
print(uniqueOccurrences([-3,0,1,-3,1,1,1,-3,10,0])) // true

//: [下一道题](@next)
