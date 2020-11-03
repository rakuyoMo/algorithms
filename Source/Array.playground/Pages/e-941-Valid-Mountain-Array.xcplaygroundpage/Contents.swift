//: [Previous](@previous)

import Foundation

/// 941. 有效的山脉数组 简单
///
/// 给定一个整数数组 `A`，如果它是有效的山脉数组就返回 `true`，否则返回 `false`。
///
/// 让我们回顾一下，如果 A 满足下述条件，那么它是一个山脉数组：
/// - `A.length >= 3`
/// - 在 `0 < i < A.length - 1` 条件下，存在 `i` 使得：
///     - `A[0] < A[1] < ... A[i-1] < A[i]`
///     - `A[i] > A[i+1] > ... > A[A.length - 1]`
///
/// - Parameter A:
/// - Returns:
func validMountainArray(_ A: [Int]) -> Bool {
    
    guard A.count >= 3 else { return false }
    
    var target = A[0]
    var isAscending = true
    
    var result = false
    
    for i in 1 ..< A.count {
        
        let value = A[i]
        
        if value == target {
            result = false
            break
        }
        
        if isAscending {
            if value < target {
                
                if i == 1 { break }
                
                result = true
                isAscending = false
            }
            
        } else if value > target {
            result = false
            break
        }
        
        target = value
    }
    
    return result
}

print(validMountainArray([2,1])) // false
print(validMountainArray([3,5,5])) // false
print(validMountainArray([0,3,2,1])) // true
print(validMountainArray([0,1,2,3,4,5,6,7,8,9])) // false
print(validMountainArray([2,0,2])) // false
print(validMountainArray([9,8,7,6,5,4,3,2,1,0])) // false
print(validMountainArray([1,7,9,5,4,1,2])) // false

//: [Next](@next)
