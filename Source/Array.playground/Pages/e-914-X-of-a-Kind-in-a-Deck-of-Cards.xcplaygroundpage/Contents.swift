//: [Previous](@previous)

import Foundation

/// 914. 卡牌分组 简单
///
/// [url](https://leetcode-cn.com/problems/x-of-a-kind-in-a-deck-of-cards/)
///
/// 给定一副牌，每张牌上都写着一个整数。
///
/// 此时，你需要选定一个数字 `X`，使我们可以将整副牌按下述规则分成 1 组或更多组：
///
/// - 每组都有 `X` 张牌。
/// - 组内所有的牌上都写着相同的整数。
///
/// 仅当你可选的 `X >= 2` 时返回 `true`。
///
/// - Parameter deck:
/// - Returns:
func hasGroupsSizeX(_ deck: [Int]) -> Bool {
    
    guard deck.count >= 2 else { return false }
    
    var group: [Int : Int] = [:]
    
    // 计算出现次数
    for card in deck {
        group[card] = (group[card] ?? 0) + 1
    }
    
    // 去重，并按升序排序
    let values = Array(Set(group.values)).sorted(by: <)
    
    // 只有一个结果的话，判断这个结果是否大于 2
    guard values.count >= 2 else { return (values.first ?? 0) >= 2 }
    
    // 被除数
    var dividend = values[0]
    
    // 除数
    var divisor = values[1]
    
    // 余数
    var remainder = dividend % divisor
    
    // 求最大公约数
    while remainder != 0 {
        
        dividend = divisor
        divisor = remainder
        remainder = dividend % divisor
    }
    
    if values.count > 2 {
        
        for i in 2 ..< values.count {
            
            // 这个时候 divisor 就是最大公约数
            if values[i] % divisor != 0 {
                return false
            }
        }
    }
    
    return divisor >= 2
}

/**
  * 思路也是先分组
  *
  * 不过封装了辗转相除的方法，然后可以用 `reduce` 把整个数组辗转相除
  *
  * 相比较上面的排序方法，节省了排序的时间，但是多出来很多除法，不确定哪个更快一些
  * 但是这个方法感觉更加简洁
  *
  * 总感觉这个方法是 for 循环的嵌套，比 n² 小，最小值可能是 n ？
  */
func hasGroupsSizeX2(_ deck: [Int]) -> Bool {
    
    var group: [Int : Int] = [:]
    
    // 计算出现次数
    for card in deck {
        group[card] = (group[card] ?? 0) + 1
    }
    
    let values = group.values
    
    if let first = values.first {
        
        // 可以 dropFirst，然后用 first 去跟后面的辗转相除
        return values.dropFirst().reduce(first) { gcd($0, $1) } >= 2
    }
    
    return false
}

private func gcd(_ a: Int, _ b: Int) -> Int {
    return a % b == 0 ? b : gcd(b, a % b)
}

print(hasGroupsSizeX2([1,2,3,4,4,3,2,1])) // true
print(hasGroupsSizeX2([1,1,1,2,2,2,3,3])) // false
print(hasGroupsSizeX2([1])) // false
print(hasGroupsSizeX2([1,1])) // true
print(hasGroupsSizeX2([1,1,2,2,2,2])) // true

//: [Next](@next)
