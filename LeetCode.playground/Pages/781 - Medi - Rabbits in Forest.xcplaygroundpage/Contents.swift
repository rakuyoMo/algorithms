//: [Previous](@previous)

import Foundation

/*:
 *  - 题目：
 *
 *  森林中，每个兔子都有颜色。其中一些兔子（可能是全部）告诉你还有多少其他的兔子和自己有相同的颜色。我们将这些回答放在 answers 数组里。
 *  返回森林中兔子的最少数量。
 *
 *  - 示例：
 *  1. 输入: answers = [1, 1, 2]，输出: 5
 *  2. 输入: answers = [10, 10, 10]，输出: 11
 *  3. 输入: answers = []，输出: 0
 *
 *
 *  - 解释:
 *
 *  两只回答了 "1" 的兔子可能有相同的颜色，设为红色。
 *  之后回答了 "2" 的兔子不会是红色，否则他们的回答会相互矛盾。
 *  设回答了 "2" 的兔子为蓝色。
 *  此外，森林中还应有另外 2 只蓝色兔子的回答没有包含在数组中。
 *  因此森林中兔子的最少数量是 5: 3 只回答的和 2 只没有回答的。
 *
 *  - 说明:
 *
 *  1. answers 的长度最大为1000。
 *  2. answers[i] 是在 [0, 999] 范围内的整数。
 */
class Solution {

    /* 测试用例 */
    let testOne   = [1, 1, 2]       // 5
    let testTwo   = [10, 10, 10]    // 11
    let testThree = [Int]()         // 0
    let testFour  = [0, 0, 1, 1, 1] // 6
}

extension Solution {
    
    func numRabbits(_ answers: [Int]) -> Int {
        
        let counts = answers.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        
        return counts.reduce(into: 0) {
            $0 += Int(ceil(Double($1.value) / Double($1.key + 1))) * ($1.key + 1)
        }
    }

    func runTest() {
        
        numRabbits(testOne)
        numRabbits(testTwo)
        numRabbits(testThree)
        numRabbits(testFour)
    }
}

Solution().runTest()

//: [Next](@next)
