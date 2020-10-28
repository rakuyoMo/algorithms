//: [Previous](@previous)

import Foundation

/// 1207. 独一无二的出现次数 简单
///
/// [url](https://leetcode-cn.com/problems/unique-number-of-occurrences/)
///
/// 给你一个整数数组 `arr`，请你帮忙统计数组中每个数的出现次数。
///
/// 如果每个数的出现次数都是独一无二的，就返回 `true`；否则返回 `false`。
///
/// - Parameter arr:
/// - Returns:
func uniqueOccurrences(_ arr: [Int]) -> Bool {
    
    var table: [Int : Int] = [:]
    
    for value in arr {
        table[value] = (table[value] ?? 0) + 1
    }
    
    let values = table.values
    
    return Set(values).count == values.count
}

print(uniqueOccurrences([1,2])) // false
print(uniqueOccurrences([1,2,2,1,1,3])) // true
print(uniqueOccurrences([-3,0,1,-3,1,1,1,-3,10,0])) // true

//: [Next](@next)
