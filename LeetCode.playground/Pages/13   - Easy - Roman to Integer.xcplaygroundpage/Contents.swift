//: [Previous](@previous)

import Foundation

/**
 *  - 题目：
 *
 *  罗马数字包含以下七种字符：I， V， X， L，C，D 和 M。
 *
 *  字符  数值
 *   I    1
 *   V    5
 *   X    10
 *   L    50
 *   C    100
 *   D    500
 *   M    1000
 *
 *  例如，罗马数字
 *       2 写做 II ，即为两个并列的 1。
 *       12 写做 XII ，即为 X + II 。
 *       27 写做  XXVII, 即为 XX + V + II 。
 *
 *  通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。
 *  数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。
 *  同样地，数字 9 表示为 IX。
 *
 *  这个特殊的规则只适用于以下六种情况：
 *
 *  I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
 *  X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
 *  C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
 *
 *  给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。
 */
class Solution {

    /* 测试用例 */
    let testOne    = "III"     // 3
    let testTwo    = "IV"      // 4
    let testThree  = "IX"      // 9
    let testFour   = "CD"      // 400
    let testFive   = "CM"      // 900
    let testSix    = "LVIII"   // C = 100, L = 50, XXX = 30, III = 3; 58
    let testSeven  = "MCMXCIV" // M = 1000, CM = 900, XC = 90, IV = 4; 1994
}

// MARK: -

extension Solution {
    
    func romanToInt(_ s: String) -> Int {
        
        func specialRoman(aKnownSum:inout Int, _ tuple:(String, Int)) -> Int {

            let componentsArr = s.components(separatedBy: tuple.0)
            
            aKnownSum += tuple.1
            
            for str in componentsArr {
                aKnownSum += romanToInt(str)
            }
            
            return aKnownSum
        }

        var sum: Int = 0

        if s.contains("IV") { return specialRoman(aKnownSum: &sum, ("IV", 4))   }
        if s.contains("IX") { return specialRoman(aKnownSum: &sum, ("IX", 9))   }
        if s.contains("XL") { return specialRoman(aKnownSum: &sum, ("XL", 40))  }
        if s.contains("XC") { return specialRoman(aKnownSum: &sum, ("XC", 90))  }
        if s.contains("CD") { return specialRoman(aKnownSum: &sum, ("CD", 400)) }
        if s.contains("CM") { return specialRoman(aKnownSum: &sum, ("CM", 900)) }
        
        for char in s {
            
                   if char == "I" { sum += 1
            } else if char == "V" { sum += 5
            } else if char == "X" { sum += 10
            } else if char == "L" { sum += 50
            } else if char == "C" { sum += 100
            } else if char == "D" { sum += 500
            } else if char == "M" { sum += 1000 }
        }
        
        return sum
    }
    
    func runTest() {
        
        romanToInt(testOne)
        romanToInt(testTwo)
        romanToInt(testThree)
        romanToInt(testFour)
        romanToInt(testFive)
        romanToInt(testSix)
        romanToInt(testSeven)
    }
}

Solution().runTest()

// MARK: - LeetCode 最速解答

extension Solution {
    
    /**
     *  只需记录上一个字符的内容即可
     */
    func romanToInt2(_ s: String) -> Int {
        
        var lastChar: Character = "O"
        var res = 0
        
        for char in s {
            
                   if char == "I" { res += 1
            } else if char == "V" { res += lastChar == "I" ? 3   : 5
            } else if char == "X" { res += lastChar == "I" ? 8   : 10
            } else if char == "L" { res += lastChar == "X" ? 30  : 50
            } else if char == "C" { res += lastChar == "X" ? 80  : 100
            } else if char == "D" { res += lastChar == "C" ? 300 : 500
            } else if char == "M" { res += lastChar == "C" ? 800 : 1000 }
            
            lastChar = char
        }
        
        return res
    }
    
    func runTest2() {
        
        romanToInt2(testOne)
        romanToInt2(testTwo)
        romanToInt2(testThree)
        romanToInt2(testFour)
        romanToInt2(testFive)
        romanToInt2(testSix)
        romanToInt2(testSeven)
    }
}

Solution().runTest2()

// MARK: - 更具扩展性

extension Solution {
    
    /**
     *  利用字典记录对应关系。之后从尾向首进行遍历。
    */
    func romanToInt3(_ s: String) -> Int {
        
        var result = 0
        let dict = [
            "I" : 1,
            "V" : 5,
            "X" : 10,
            "L" : 50,
            "C" : 100,
            "D" : 500,
            "M" : 1000
        ]
        
        var currentIndex = s.endIndex
        var currentValue = 0
        
        while currentIndex != s.startIndex {
            
            // 获取范围，currentIndex 的前一个到 currentIndex
            let prevIndex = s.index(before: currentIndex)

            // 先获取当前字符，再从字典中获取值
            let prevValue = dict[String(s[prevIndex])]!
            
            // 取和
            result += prevValue >= currentValue ? prevValue : -prevValue
            
            currentIndex = prevIndex
            currentValue = prevValue
        }
        
        return result
    }
    
    func runTest3() {
        
        romanToInt3(testOne)
        romanToInt3(testTwo)
        romanToInt3(testThree)
        romanToInt3(testFour)
        romanToInt3(testFive)
        romanToInt3(testSix)
        romanToInt3(testSeven)
    }
}

Solution().runTest3()

//: [Next](@next)
