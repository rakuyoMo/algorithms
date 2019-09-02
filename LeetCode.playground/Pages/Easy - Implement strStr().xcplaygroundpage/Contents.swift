//: [Previous](@previous)
/*:
 实现 strStr() 函数。
 
 给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。
 
 示例 1:
 
 输入: haystack = "hello", needle = "ll"
 输出: 2
 示例 2:
 
 输入: haystack = "aaaaa", needle = "bba"
 输出: -1
 说明:
 
 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 
 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。
 */
import Foundation

// 测试用例
let testOne   = (haystack : "hello", needle : "ll")         // 2
let testTwo   = (haystack : "aaaaa", needle : "bba")        // -1
let testThree = (haystack : "hello", needle : "")           // 0
let testFour  = (haystack : ""     , needle : "a")          // -1
let testFive  = (haystack : "aaa"  , needle : "a")          // 0
let testSix   = (haystack : "mississippi", needle : "pi")   // 9
let testSeven = (haystack : "aaaa", needle : "baaa")        // -1

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */

func strStr(_ haystack: String, _ needle: String) -> Int {
    
    guard !needle.isEmpty else { return 0 }
    guard needle.count <= haystack.count else { return -1 }
    
    var index = haystack.startIndex
    
    let lastIndex = haystack.index(haystack.endIndex, offsetBy: -needle.count + 1)
   
    while index != lastIndex {
        let offsetTwoIndex = haystack.index(index, offsetBy: needle.count)

        if haystack[index ..< offsetTwoIndex] == needle {
            return index.encodedOffset
        }
        
        index = haystack.index(index, offsetBy: 1);
    }
    
    return -1
}

strStr(testOne.haystack,   testOne.needle)      // 2
strStr(testTwo.haystack,   testTwo.needle)      // -1
strStr(testThree.haystack, testThree.needle)    // 0
strStr(testFour.haystack,  testFour.needle)     // -1
strStr(testFive.haystack,  testFive.needle)     // 0
strStr(testSix.haystack,   testSix.needle)      // 9
strStr(testSeven.haystack, testSeven.needle)    // -1

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */
/*:
 **LeetCode 最速解答**
 
 转成 C 字符 Char 格式
 */
func strStr2(_ haystack: String, _ needle: String) -> Int {
    
    let count1 = haystack.count
    let count2 = needle.count
    
    if count2 == 0 { return 0 }
    if count1 < count2 { return -1 }
    
    var haystackChars = haystack.cString(using: .utf8)!
    var needleChars = needle.cString(using: .utf8)!
    var i = 0
    var j = 0
    
    let maxi = count1 - count2
    let maxj = count2 - 1
    
    while i <= maxi && j <= maxj {
        var m = i
        while m <= count1 - 1 && j <= maxj {
            let mv = haystackChars[m]
            let jv = needleChars[j]
            if mv == jv {
                m += 1
                j += 1
                continue
            }
            
            j = 0
            i += 1
            break
        }
    }
    
    j -= 1
    
    if j == maxj { return i }
    
    return -1
}

strStr2(testOne.haystack,   testOne.needle)      // 2
strStr2(testTwo.haystack,   testTwo.needle)      // -1
strStr2(testThree.haystack, testThree.needle)    // 0
strStr2(testFour.haystack,  testFour.needle)     // -1
strStr2(testFive.haystack,  testFive.needle)     // 0
strStr2(testSix.haystack,   testSix.needle)      // 9
strStr2(testSeven.haystack, testSeven.needle)    // -1

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */
/*:
 **LeetCode 解答 速度第二 **
 
 无需将 needle 字符串截取出来，只需要找到子串，并且以 needle 开头即可。
 */
func strStr3(_ haystack: String, _ needle: String) -> Int {
    let hCount = haystack.count
    let nCount = needle.count
    
    if nCount == 0     { return 0  }
    if hCount < nCount { return -1 }
    
    for i in 0 ... hCount - nCount {
        let start = haystack.index(haystack.startIndex, offsetBy: i)
        let end = haystack.endIndex
        
        if String(haystack[start ..< end]).hasPrefix(needle) { return i }
    }
    
    return -1
}

strStr3(testOne.haystack,   testOne.needle)      // 2
strStr3(testTwo.haystack,   testTwo.needle)      // -1
strStr3(testThree.haystack, testThree.needle)    // 0
strStr3(testFour.haystack,  testFour.needle)     // -1
strStr3(testFive.haystack,  testFive.needle)     // 0
strStr3(testSix.haystack,   testSix.needle)      // 9
strStr3(testSeven.haystack, testSeven.needle)    // -1

//: [Next](@next)
