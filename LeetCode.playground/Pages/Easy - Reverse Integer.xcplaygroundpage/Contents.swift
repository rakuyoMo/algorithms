//: [Previous](@previous)
/*:
 给定一个 32 位有符号整数，将整数中的数字进行反转。
 
 示例 1:
 
 输入: 123
 输出: 321
 示例 2:
 
 输入: -123
 输出: -321
 示例 3:
 
 输入: 120
 输出: 21
 注意:
 
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231,  231 − 1]。根据这个假设，如果反转后的整数溢出，则返回 0。
 */
import Foundation

// 测试用例
let testOne   = 123
let testTwo   = -123
let testThree = 120
let testFour  = 10
let testFive  = 901000
let testSix   = 901002
let testSeven = -100
let testEight = 1534236469

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- */

// 转字符串的写法
func reverse(_ x: Int) -> Int {

    var result = 0
    
    if x >= 0 {
        result = Int(String(String(x).reversed()))!
        
    } else {
        var tmpStr = String(x)
        
        tmpStr.removeFirst()
        tmpStr = String(tmpStr.reversed())
        
        tmpStr.insert("-", at: tmpStr.startIndex)
        
        result = Int(tmpStr)!
    }

    let upperLimit = 1 << 31 - 1
    let lowerLimit = -1 << 31
    
    if result > upperLimit || result < lowerLimit { return 0 }
    
    return result;
}

reverse(testOne)
reverse(testTwo)
reverse(testThree)
reverse(testFour)
reverse(testSix)
reverse(testFive)
reverse(testSeven)
reverse(testEight)

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- */
/*:
 **最佳解答**
 
 取余拿最后一位
 */
func reverse2(_ x: Int) -> Int {
    var result = 0
    var tmpx = x
    
    while tmpx != 0 {
        
        // 负数取余后带负号，所以不用再判断正负
        result = result * 10 + tmpx % 10
        tmpx = tmpx / 10
    }

     if result < Int32.min || result > Int32.max {
        return 0
    }
    
    return result
}

reverse2(testOne)
reverse2(testTwo)
reverse2(testThree)
reverse2(testFour)
reverse2(testSix)
reverse2(testFive)
reverse2(testSeven)
reverse2(testEight)
//: [Next](@next)
