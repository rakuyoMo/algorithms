//: [Previous](@previous)
/*:
 编写一个函数来查找字符串数组中的最长公共前缀。
 
 如果不存在公共前缀，返回空字符串 ""。
 
 示例 1:
 
 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:
 
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:
 
 所有输入只包含小写字母 a-z 。
 */
import Foundation

// 测试用例
var testOne   = ["flower", "flow", "flight"]  // "fl"
var testTwo   = ["dog", "racecar", "car"]     // ""
var testThree: [String] = []                // ""

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */

func longestCommonPrefix(_ strs: [String]) -> String {
    guard let prefix = strs.first else { return "" }
    
    var tmpStr = strs[0]
    
    var i = 1
    
    while i < strs.count {
        
        if strs[i].hasPrefix(tmpStr) { i += 1
            
        } else { tmpStr = String(tmpStr.prefix(tmpStr.count - 1)) }
    }
    
    return tmpStr
}

longestCommonPrefix(testOne)
longestCommonPrefix(testTwo)
longestCommonPrefix(testThree)

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- */
/*:
 **最佳解答**
 和 上面的答案 耗时相同
 */
func longestCommonPrefix2(_ strs: [String]) -> String {
    let count = strs.count
    
    if count == 0 {
        return ""
    }
    if count == 1 {
        return strs.first!
    }
    
    var result = strs.first!
    for i in 1..<count {
        while !strs[i].hasPrefix(result) {
            result = String(result.prefix(result.count - 1))
            if result.count == 0 {
                return ""
            }
        }
    }
    return result
}

longestCommonPrefix2(testOne)
longestCommonPrefix2(testTwo)
longestCommonPrefix2(testThree)

//: [Next](@next)
