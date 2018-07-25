//: [Previous](@previous)
/*:
 将字符串 "PAYPALISHIRING" 以Z字形排列成给定的行数：
 
 P   A   H   N
 A P L S I I G
 Y   I   R
 之后从左往右，逐行读取字符："PAHNAPLSIIGYIR"
 
 实现一个将字符串进行指定行数变换的函数:
 
 string convert(string s, int numRows);
 示例 1:
 
 输入: s = "PAYPALISHIRING", numRows = 3
 输出: "PAHNAPLSIIGYIR"
 示例 2:
 
 输入: s = "PAYPALISHIRING", numRows = 4
 输出: "PINALSIGYAHRPI"
 解释:
 
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 */
import Foundation

// 测试用例
let testOne   = (s:"PAYPALISHIRING", numRows:1)   // PAYPALISHIRING
let testTwo   = (s:"PAYPALISHIRING", numRows:2)
let testThree = (s:"PAYPALISHIRING", numRows:3)   // PAHNAPLSIIGYIR
let testFour  = (s:"PAYPALISHIRING", numRows:4)   // PINALSIGYAHRPI
let testFive  = (s:"PAYPALISHIRING", numRows:5)
let testSix   = (s:"PAYPAL"        , numRows:6)

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */

func convert(_ s: String, _ numRows: Int) -> String {
    
    if numRows == 1 || s.count <= numRows { return s; }
    
    

    return ""
}

convert(testOne.s   ,testOne.numRows)   // PAYPALISHIRING
convert(testTwo.s   ,testTwo.numRows)
convert(testThree.s ,testThree.numRows) // PAHNAPLSIIGYIR
convert(testFour.s  ,testFour.numRows)  // PINALSIGYAHRPI
convert(testFive.s  ,testFive.numRows)
convert(testSix.s   ,testSix.numRows)   // PAYPAL

//: [Next](@next)
