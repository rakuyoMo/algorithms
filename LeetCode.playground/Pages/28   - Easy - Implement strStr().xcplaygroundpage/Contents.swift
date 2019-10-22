//: [Previous](@previous)

import Foundation

/**
 *  - 题目：
 *  
 *  实现 strStr() 函数。
 *
 *  给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。
 *  如果不存在，则返回  -1。
 *
 *  - 示例：
 *
 *  1. 输入: haystack = "hello", needle = "ll"，输出: 2
 *  2. 输入: haystack = "aaaaa", needle = "bba"，输出: -1

 *  - 说明：
 *
 *  当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 *  对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。
 */
class Solution {

    /* 测试用例 */
    let testOne   = (haystack : "hello", needle : "ll")         // 2
    let testTwo   = (haystack : "aaaaa", needle : "bba")        // -1
    let testThree = (haystack : "hello", needle : "")           // 0
    let testFour  = (haystack : ""     , needle : "a")          // -1
    let testFive  = (haystack : "aaa"  , needle : "a")          // 0
    let testSix   = (haystack : "mississippi", needle : "pi")   // 9
    let testSeven = (haystack : "aaaa", needle : "baaa")        // -1
}

// MARK: -

extension Solution {
    
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
    
    func runTest() {
        
        strStr(testOne.haystack,   testOne.needle)
        strStr(testTwo.haystack,   testTwo.needle)
        strStr(testThree.haystack, testThree.needle)
        strStr(testFour.haystack,  testFour.needle)
        strStr(testFive.haystack,  testFive.needle)
        strStr(testSix.haystack,   testSix.needle)
        strStr(testSeven.haystack, testSeven.needle)
    }
}

Solution().runTest()

// MARK: - LeetCode 最速解答

extension Solution {
    
    /**
    *  转成 C 字符 Char 格式
    */
    func strStr2(_ haystack: String, _ needle: String) -> Int {
        
        let count1 = haystack.count
        let count2 = needle.count
        
        if count2 == 0 { return 0 }
        if count1 < count2 { return -1 }
        
        let haystackChars = haystack.cString(using: .utf8)!
        let needleChars = needle.cString(using: .utf8)!
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
    
    func runTest2() {
        
        strStr2(testOne.haystack,   testOne.needle)
        strStr2(testTwo.haystack,   testTwo.needle)
        strStr2(testThree.haystack, testThree.needle)
        strStr2(testFour.haystack,  testFour.needle)
        strStr2(testFive.haystack,  testFive.needle)
        strStr2(testSix.haystack,   testSix.needle)
        strStr2(testSeven.haystack, testSeven.needle)
    }
}

Solution().runTest2()

// MARK: - LeetCode 解答 速度第二

extension Solution {
    
    /**
     *  无需将 needle 字符串截取出来，只需要找到子串，并且以 needle 开头即可。
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
    
    func runTest3() {
        
        strStr3(testOne.haystack,   testOne.needle)
        strStr3(testTwo.haystack,   testTwo.needle)
        strStr3(testThree.haystack, testThree.needle)
        strStr3(testFour.haystack,  testFour.needle)
        strStr3(testFive.haystack,  testFive.needle)
        strStr3(testSix.haystack,   testSix.needle)
        strStr3(testSeven.haystack, testSeven.needle)
    }
}

Solution().runTest3()

//: [Next](@next)
