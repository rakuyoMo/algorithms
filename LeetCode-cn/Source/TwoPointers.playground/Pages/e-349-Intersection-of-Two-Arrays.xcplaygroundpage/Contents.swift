//: [Previous](@previous)

import Foundation

/// 349. 两个数组的交集 简单
///
/// 给定两个数组，编写一个函数来计算它们的交集。
///
/// - Parameters:
///   - nums1:
///   - nums2:
/// - Returns:
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    return Array(Set(nums1).intersection(Set(nums2)))
}

func intersection2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    let _nums1 = nums1.sorted()
    let _nums2 = nums2.sorted()
    
    var left = 0
    var righ = 0
    
    var result: [Int] = []
    
    while left < _nums1.count && righ < _nums2.count {
        
        let _left = _nums1[left]
        let _righ = _nums2[righ]
        
        if _left == _righ {
            
            left += 1
            righ += 1
            
            if result.firstIndex(of: _left) == nil {
                result.append(_left)
            }
            
            continue
        }
        
        if _left < _righ {
            left += 1
        } else {
            righ += 1
        }
    }
    
    return result
}

print(intersection2([1,2,2,1], [2,2])) // [2]
print(intersection2([4,9,5], [9,4,9,8,4])) // [9,4]

//: [Next](@next)
