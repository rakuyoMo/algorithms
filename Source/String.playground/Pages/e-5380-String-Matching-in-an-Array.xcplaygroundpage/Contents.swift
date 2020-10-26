//: [Previous](@previous)

import Foundation

/// 5380. 数组中的字符串匹配 简单
///
/// [url](https://leetcode-cn.com/problems/string-matching-in-an-array/)
///
/// 给你一个字符串数组 `words` ，数组中的每个字符串都可以看作是一个单词。
/// 请你按 **任意** 顺序返回 `words` 中是其他单词的子字符串的所有单词。
///
/// 如果你可以删除 `words[j]` 最左侧和/或最右侧的若干字符得到 `word[i]` ，
/// 那么字符串 `words[i]` 就是 `words[j]` 的一个子字符串。
///
/// - Parameter words:
/// - Returns:
func stringMatching(_ words: [String]) -> [String] {
    
    var result = Set<String>()
    
    for word in words {
        
        for tmp in words {
            
            if tmp != word && tmp.contains(word) {
                result.insert(word)
            }
        }
    }
    
    return [String](result)
}

print(stringMatching(["leetcoder","leetcode","od","hamlet","am"])) // ["leetcode","od","am"]
print(stringMatching(["mass","as","hero","superhero"])) // ["as","hero"]
print(stringMatching(["leetcode","et","code"])) // ["et","code"]
print(stringMatching(["blue","green","bu"])) // []

//: [Next](@next)
