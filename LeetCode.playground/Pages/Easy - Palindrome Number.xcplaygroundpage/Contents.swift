//: [Previous](@previous)
/*:
 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
 
 示例 1:
 
 输入: 121
 输出: true
 示例 2:
 
 输入: -121
 输出: false
 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 示例 3:
 
 输入: 10
 输出: false
 解释: 从右向左读, 为 01 。因此它不是一个回文数。
 进阶:
 
 你能不将整数转为字符串来解决这个问题吗？
 */
import Foundation

// 测试用例
let testOne     = 121
let testTwo     = -121
let testThree   = 10
let testFour    = 1001
let testFive    = 1010
let testSix     = 10101
let testSeven   = 0

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */

// 字符串的写法
func isPalindrome(_ x: Int) -> Bool {
    
    let tmpStr = String(x)
    
    let hafLength = tmpStr.count / 2
    
    return tmpStr.prefix(hafLength) == String(tmpStr.suffix(hafLength).reversed())
}

isPalindrome(testOne)   // 121      - true
isPalindrome(testTwo)   // -121     - false
isPalindrome(testThree) // 10       - false
isPalindrome(testFour)  // 1001     - true
isPalindrome(testFive)  // 1010     - false
isPalindrome(testSix)   // 10101    - true
isPalindrome(testSeven) // 0        - true

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */
/*:
 **LeetCode 最速解答**
 */
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

isPalindrome2(testOne)   // 121      - true
isPalindrome2(testTwo)   // -121     - false
isPalindrome2(testThree) // 10       - false
isPalindrome2(testFour)  // 1001     - true
isPalindrome2(testFive)  // 1010     - false
isPalindrome2(testSix)   // 10101    - true
isPalindrome2(testSeven) // 0        - true

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */
/*:
 **思路最佳**
 
 采用反转一半数字的形式
 */
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

isPalindrome3(testOne)   // 121      - true
isPalindrome3(testTwo)   // -121     - false
isPalindrome3(testThree) // 10       - false
isPalindrome3(testFour)  // 1001     - true
isPalindrome3(testFive)  // 1010     - false
isPalindrome3(testSix)   // 10101    - true
isPalindrome3(testSeven) // 0        - true
//: [Next](@next)
