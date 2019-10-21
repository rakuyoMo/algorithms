//: [Previous](@previous)

import Foundation

// 测试用例
let testOne = 9
let testTwo = 10000

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */

func lastRemaining(_ n: Int) -> Int {
    return n == 1 ? 1 : 2 * (n / 2 + 1 - lastRemaining(n / 2))
}

lastRemaining(testOne)
lastRemaining(testTwo)

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */

/*:
** 自己写的错误解答，执行 lastRemaining2(testTwo) 时会超时 **
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

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */

//: [Next](@next)
