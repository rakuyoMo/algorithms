//: [Previous](@previous)

import Foundation

/// 57. 插入区间 困难
///
/// 给出一个*无重叠的*，按照区间起始端点排序的区间列表。
///
/// 在列表中插入一个新的区间，你需要确保列表中的区间仍然有序且不重叠（如果有必要的话，可以合并区间）。
///
/// - Parameters:
///   - intervals:
///   - newInterval:
/// - Returns:
func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    
    guard !intervals.isEmpty else { return [newInterval] }
    
    guard !newInterval.isEmpty else { return intervals }
    
    var result = intervals
    
    let targetFirst = newInterval.first!
    let targetLast  = newInterval.last!
    
    for i in 0 ..< intervals.count {
        
        let interval = intervals[i]
        
        let firt = interval.first!
        let last = interval.last!
        
        if targetFirst >= firt {
            
            if targetFirst <= last {
                
                // `newInterval` 被包含在这个区间范围内，直接终止循环
                if targetLast <= last { break }
                
                // 所要插入的区间的末尾，大于当前区间的末尾，但是小于下一区间的开头
                if i >= intervals.count - 1 {
                    result[i] = [firt, targetLast]
                    
                } else {
                    let _tmp = intervals[i + 1].first!
                    
                    if targetLast == _tmp {
                        result[i] = [firt, intervals[i + 1].last!]
                        result.remove(at: i + 1)
                        
                    } else {
                        result[i] = [firt, targetLast]
                    }
                }
                
                break
            }
            
            if i >= intervals.count - 1 {
                result.append(newInterval)
                break
            }
            
            if targetLast < intervals[i + 1].first! {
                result.insert(newInterval, at: i + 1)
                break
            }
            
        } else {
            
            if targetLast < firt {
                result.insert(newInterval, at: i)
                
            } else {
                result[i] = [targetFirst, targetLast]
            }
            
            break
        }
    }
    
    /* 最后的合并区间还没做 */
    
    return result
}

print(insert([[1,3],[6,9]], [7,10])) // [[1,3],[6,10]]
print(insert([[1,3],[6,9]], [2,6])) // [[1,9]]
print(insert([[1,3],[6,9]], [2,5])) // [[1,5],[6,9]]
print(insert([[1,3],[6,9]], [4,5])) // [[1,3],[4,5],[6,9]]
print(insert([[1,3],[6,9]], [10,11])) // [[1,3],[6,9],[10,11]]

print(insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])) // [[1,2],[3,10],[12,16]]

//: [Next](@next)
