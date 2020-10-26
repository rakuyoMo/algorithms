//: [Previous](@previous)

import Foundation

/// 5381. 查询带键的排列 中等
///
/// [url](https://leetcode-cn.com/problems/queries-on-a-permutation-with-key/)
///
/// 给你一个待查数组 `queries` ，数组中的元素为 `1` 到 `m` 之间的正整数。
/// 请你根据以下规则处理所有待查项 `queries[i]`（从 `i=0` 到 `i=queries.length-1`）：
///
/// - 一开始，排列 `P=[1,2,3,...,m]`。
/// - 对于当前的 `i` ，请你找出待查项 `queries[i]` 在排列 `P` 中的位置（下标从 `0` 开始），
///   然后将其从原位置移动到排列 `P` 的起始位置（即下标为 `0` 处）。
///   注意，`queries[i]` 在 `P` 中的位置就是 `queries[i]` 的查询结果。
///
/// 请你以数组形式返回待查数组  queries 的查询结果。
///
/// - Parameters:
///   - queries:
///   - m:
/// - Returns:
func processQueries(_ queries: [Int], _ m: Int) -> [Int] {
    
    var result: [Int] = []
    var p = Array(1 ... m)
    
    for i in 0 ..< queries.count {
        
        if let index = p.firstIndex(of: queries[i]) {
            result.append(index)
            
            p.remove(at: index)
            p.insert(queries[i], at: 0)
        }
    }
    
    return result
}

print(processQueries([3,1,2,1], 5)) // [2,1,2,1]
print(processQueries([4,1,2,2], 4)) // [3,1,2,0]
print(processQueries([7,5,5,8,3], 8)) // [6,5,0,7,5]
print(processQueries([7,5,5,8,3, 100, 200, 65, 875, 325], 1000)) //

//: [Next](@next)
