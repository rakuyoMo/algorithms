//: [Previous](@previous)

import Foundation

/// 5195. 最长快乐字符串 中等
///
/// [url](https://leetcode-cn.com/problems/longest-happy-string/)
/// [题解](https://leetcode-cn.com/problems/longest-happy-string/solution/er-wei-shu-zu-by-rakuyomo/)
///
/// 如果字符串中不含有任何 `'aaa'`，`'bbb'` 或 `'ccc'` 这样的字符串作为子串，
/// 那么该字符串就是一个「快乐字符串」。
///
/// 给你三个整数 `a`，`b`，`c`，请你返回 任意一个 满足下列全部条件的字符串 `s`：
///
/// - `s` 是一个尽可能长的快乐字符串。
/// - `s` 中 最多 有 `a` 个字母 `'a'`、`b` 个字母 `'b'`、`c` 个字母 `'c'` 。
/// - `s` 中只含有 `'a'`、`'b'` 、`'c'` 三种字母。
///
/// 如果不存在这样的字符串 `s` ，请返回一个空字符串 `""`。
///
/// - Parameters:
///   - a:
///   - b:
///   - c:
/// - Returns:
func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
    
    if a >= b && a >= c {
        
        if b >= c {
            return helper(max: (a, "a"), other: (b, "b"), another: (c, "c"))
        } else {
            return helper(max: (a, "a"), other: (c, "c"), another: (b, "b"))
        }
    }
    
    if b >= a && b >= c {
        
        if a >= c {
            return helper(max: (b, "b"), other: (a, "a"), another: (c, "c"))
        } else {
            return helper(max: (b, "b"), other: (c, "c"), another: (a, "a"))
        }
    }
    
    if c >= a && c >= b {
        
        if a >= b {
            return helper(max: (c, "c"), other: (a, "a"), another: (b, "b"))
        } else {
            return helper(max: (c, "c"), other: (b, "b"), another: (a, "a"))
        }
    }
    
    return ""
}

func helper(
    max: (count: Int, str: String),
    other: (count: Int, str: String),
    another: (count: Int, str: String)
) -> String {
    
    var arrays: [[String]] = []
    
    var tmp: [String] = []
    
    for _ in 0 ..< max.count {
        
        tmp.append(max.str)
        
        if tmp.count == 2 {
            arrays.append(tmp)
            tmp = []
        }
    }
    
    // 处理单数个的情况
    if !tmp.isEmpty {
        arrays.append(tmp)
    }
    
    // other 和 another 共用1个 j，所以放在 `handle(tuple:)` 之外
    var j = 0
    
    func handle(tuple: (count: Int, str: String)) {
        
        for _ in 0 ..< tuple.count {
            arrays[j].append(tuple.str)
            j += 1
            
            if j >= arrays.count {
                j = 0
            }
        }
    }
    
    handle(tuple: other)
    handle(tuple: another)
    
    // 标记此后出现的长度小于等于2的元素都需要被舍弃掉
    var isDiscard = false
    
    return arrays.filter {
        
        // 过滤掉长度小于等于 2 的元素
        if $0.count <= 2 && isDiscard == true { return false }
        
        // 标记出现过长度小于等于2个的元素
        if $0.count <= 2 { isDiscard = true }
        
        return true
        
    }.map { $0.joined() }.joined()
}

print(longestDiverseString(1, 8, 12)) // "ccbccbccbbccbbccbbcca"
print(longestDiverseString(1, 1, 7))  // "ccaccbcc"
print(longestDiverseString(0, 0, 0))  // "abc"
print(longestDiverseString(1, 1, 1))  // "abc"
print(longestDiverseString(2, 2, 1))  // "aabbc"
print(longestDiverseString(7, 1, 0))

//: [Next](@next)
