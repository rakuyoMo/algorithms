//: [Previous](@previous)

import Foundation

/// 134. 加油站 中等
///
/// [url](https://leetcode-cn.com/problems/gas-station/)
///
/// 在一条环路上有 N 个加油站，其中第 `i` 个加油站有汽油 `gas[i]` 升。
///
/// 你有一辆油箱容量无限的的汽车，从第 `i` 个加油站开往第 `i+1` 个加油站需要消耗汽油 `cost[i]` 升。
/// 你从其中的一个加油站出发，开始时油箱为空。
///
/// 如果你可以绕环路行驶一周，则返回出发时加油站的编号，否则返回 `-1`。
///
/// 说明:
///
/// - 如果题目有解，该答案即为唯一答案。
/// - 输入数组均为非空数组，且长度相同。
/// - 输入数组中的元素均为非负数。
///
/// - Parameters:
///   - gas:
///   - cost:
/// - Returns:
func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    
    // 结果
    var result = -1
    
    // 起点位置
    var stat = 0
    
    // 经过的点的数量
    var count = 0
    
    // 当前的容量
    var gasoline = 0
    
    // 当前点
    var i = 0
    
    while i < gas.count {
        
        let tmp = gasoline + gas[i] - cost[i]
        
        // 足够到达下一个目的地
        if tmp >= 0 {
            
            // 已经一圈了
            if count == gas.count {
                result = i
                break
            }
            
            count += 1
            gasoline = tmp
            
            // 重置起点
            if i == gas.count - 1 {
                i = 0
            } else {
                i += 1
            }
            
            continue
        }
        
        // 循环结束，无法绕圈
        if stat == gas.count { break }
        
        // 不够到达下一个目的地，从下一个位置开始尝试
        gasoline = 0
        count = 0
        
        stat += 1
        i = stat
    }
    
    return result
}

func canCompleteCircuit2(_ gas: [Int], _ cost: [Int]) -> Int {
    
    var left = 0 // 余量
    var start = 0 // 初始选索引 0 作为起点
    
    var totalGas = 0, totalCost = 0
    
    for i in 0 ..< gas.count {
        
        totalGas += gas[i]
        totalCost += cost[i]
        
        left += gas[i] - cost[i] // 累加每次的剩余量
        
        if left < 0 {    // 去不了下一站，0 到 i 都不是起点
           start = i + 1 // 把 i+1 作为起点
           left = 0      // 余量归零
        }
    }
    
    // 总油量不够，问题无解
    // 总加油>=总耗油，必然有解。当遍历结束时，最新的 start 指向成功的起点
    return totalGas < totalCost ? -1 : start
}

print(canCompleteCircuit2([1,2,3,4,5], [3,4,5,1,2])) // 3
print(canCompleteCircuit2([2,3,4], [3,4,3])) // -1

//: [Next](@next)
