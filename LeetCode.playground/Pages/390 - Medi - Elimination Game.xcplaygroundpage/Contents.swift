//: [Previous](@previous)

import Foundation

/**
 *  - 题目：
 *
 *  给定一个从1 到 n 排序的整数列表。
 *  首先，从左到右，从第一个数字开始，每隔一个数字进行删除，直到列表的末尾。
 *  第二步，在剩下的数字中，从右到左，从倒数第一个数字开始，每隔一个数字进行删除，直到列表开头。
 *  我们不断重复这两步，从左到右和从右到左交替进行，直到只剩下一个数字。
 *  返回长度为 n 的列表中，最后剩下的数字。
 *
 *  - 示例：
 *
 *  输入:
 *  n = 9,
 *  1 2 3 4 5 6 7 8 9
 *  2 4 6 8
 *  2 6
 *  6
 *
 *  输出:
 *  6
 */
class Solution {

    /* 测试用例 */
    let testOne = 9
    let testTwo = 10000
}

// MARK: -

extension Solution {
    
    func lastRemaining(_ n: Int) -> Int {
        return n == 1 ? 1 : 2 * (n / 2 + 1 - lastRemaining(n / 2))
    }
    
    func runTest() {
        
        lastRemaining(testOne)
        lastRemaining(testTwo)
    }
}

Solution().runTest()

// MARK: - 自己写的错误解答

extension Solution {
    
    /**
     * 自己写的错误解答，执行 lastRemaining2(testTwo) 时会超时
     */
    func lastRemaining2(_ n: Int) -> Int {

        guard n > 1 else { return n }

        var array: [Int] = []

        for i in 1 ... n {

            if i % 2 == 0 {
                array.append(i)
            }
        }

        while array.count > 1 {
            array = _lastRemaining(array.reversed())
        }

        guard let result = array.first else { return 0 }

        return result
    }

    func _lastRemaining(_ array: [Int]) -> [Int] {

        var tmpArray: [Int] = []

        for i in 0 ..< array.count {

            if i % 2 != 0 {
                tmpArray.append(array[i])
            }
        }

        return tmpArray
    }
    
    func runTest2() {
        
        lastRemaining2(testOne)
        lastRemaining2(testTwo)
    }
}

Solution().runTest2()

//: [Next](@next)
