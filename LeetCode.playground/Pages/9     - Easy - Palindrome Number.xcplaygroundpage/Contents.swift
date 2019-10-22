//: [Previous](@previous)

import Foundation

/**
 *  - 题目：
 *
 *  判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
 *
 *  - 示例：
 *
 *  1. 输入: 121，输出: true
 *  2. 输入: -121，输出: false，解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 *  3. 输入: 10，输出: false，解释: 从右向左读, 为 01 。因此它不是一个回文数。
 *
 *  - 进阶：
 *
 *  你能不将整数转为字符串来解决这个问题吗？
 */
class Solution {
    
    /* 测试用例 */
    let testOne   = 121   // true
    let testTwo   = -121  // false
    let testThree = 10    // false
    let testFour  = 1001  // true
    let testFive  = 1010  // false
    let testSix   = 10101 // true
    let testSeven = 0     // true
}

// MARK: - 字符串的写法

extension Solution {

    func isPalindrome(_ x: Int) -> Bool {
        
        let tmpStr = String(x)
        
        let hafLength = tmpStr.count / 2
        
        return tmpStr.prefix(hafLength) == String(tmpStr.suffix(hafLength).reversed())
    }
    
    func runTest() {
        
        isPalindrome(testOne)
        isPalindrome(testTwo)
        isPalindrome(testThree)
        isPalindrome(testFour)
        isPalindrome(testFive)
        isPalindrome(testSix)
        isPalindrome(testSeven)
    }
}

Solution().runTest()

// MARK: - LeetCode 最速解答

extension Solution {
    
    func isPalindrome2(_ x: Int) -> Bool {
        func reverseInt(_ x: Int) -> Int {
            var remain = x
            var result = 0
            while remain > 0 {
                result = result * 10 + remain % 10
                remain /= 10
            }
            return result
        }
        
        return !(x < 0 || x != reverseInt(x))
    }
    
    func runTest2() {
        
        isPalindrome2(testOne)
        isPalindrome2(testTwo)
        isPalindrome2(testThree)
        isPalindrome2(testFour)
        isPalindrome2(testFive)
        isPalindrome2(testSix)
        isPalindrome2(testSeven)
    }
}

Solution().runTest2()

// MARK: - 思路最佳

/**
 *  采用反转一半数字的形式
 */
extension Solution {
    
    func isPalindrome3(_ x: Int) -> Bool {
        
        guard (x > 0 && x % 10 != 0) || x == 0 else {
            return false
        }
        
        var remain = x
        var result = 0
        
        // 当原始数字小于结果数字时，即为反转一半
        while remain > result {
            result = result * 10 + remain % 10
            remain /= 10
        }

        return remain == result || remain == result / 10
    }
    
    func runTest3() {
        
        isPalindrome3(testOne)
        isPalindrome3(testTwo)
        isPalindrome3(testThree)
        isPalindrome3(testFour)
        isPalindrome3(testFive)
        isPalindrome3(testSix)
        isPalindrome3(testSeven)
    }
}

Solution().runTest3()

//: [Next](@next)
