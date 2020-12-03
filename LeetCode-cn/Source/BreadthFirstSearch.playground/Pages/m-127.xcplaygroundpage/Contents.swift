//: [上一道题](@previous)
/*:
 # 单词接龙
 
 - 题号：[127](https://leetcode-cn.com/problems/word-ladder/)
 - 难度：中等
 - 描述：
 
    给定两个单词（*beginWord* 和 *endWord*）和一个字典，找到从 *beginWord* 到 *endWord* 的最短转换序列的长度。
 
    - 转换需遵循如下规则：
        1. 每次转换只能改变一个字母。
        2. 转换过程中的中间单词必须是字典中的单词。
 
    - 说明:
        - 如果不存在这样的转换序列，返回 0。
        - 所有单词具有相同的长度。
        - 所有单词只由小写字母组成。
        - 字典中不存在重复的单词。
        - 你可以假设 *beginWord* 和 *endWord* 是非空的，且二者不相同。
 */

//: ## Code
import Foundation

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    
    if !wordList.contains(endWord) { return 0 }
    
    let dict = Set(wordList)
    var beginSet = Set<String>()
    var endSet = Set<String>()
    var visited = Set<String>()
    var result = 1
    var found = false
    
    beginSet.insert(beginWord)
    endSet.insert(endWord)
    
    while !found && !beginSet.isEmpty && !endSet.isEmpty {
        var resSet = Set<String>()
        
        if beginSet.count > endSet.count {
            (endSet, beginSet) = (beginSet, endSet)
        }
        
        found = foundSth(beginSet, endSet, dict, &visited, &resSet )
        beginSet = resSet
        result += 1
    }
    
    return found ? result : 0
}

func foundSth(
    _ beginSet: Set<String>,
    _ endSet: Set<String>,
    _ dict: Set<String>,
    _ visitedSet: inout Set<String>,
    _ resSet: inout Set<String>
) -> Bool {
    
    let alphaArray = Array("abcdefghijklmnopqrstuvwxyz")
    
    for word in beginSet {
        for i in 0 ..< word.count {
            
            var chars = Array(word)
            
            for j in 0 ..< alphaArray.count{
                
                chars[i] = alphaArray[j]
                
                let str = String(chars)
                
                if dict.contains(str) {
                    
                    if endSet.contains(str) {
                        return true
                    }
                    
                    if !visitedSet.contains(str) {
                        resSet.insert(str)
                        visitedSet.insert(str)
                    }
                }
            }
        }
    }
    
    return false
}

//: ## Test
print(ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])) // 5
print(ladderLength("hit", "cog", ["hot","dot","dog","lot","log"]))       // 0


//: [下一道题](@next)
