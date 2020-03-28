//
//  m-820-Short-Encoding-of-Words.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/3/28.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

extension Solution {
    
    /// 820. 单词的压缩编码 中等
    /// 
    /// 给定一个单词列表，我们将这个列表编码成一个索引字符串 `S` 与一个索引列表 `A`。
    /// 
    /// 例如，如果这个列表是 `["time", "me", "bell"]`，
    /// 我们就可以将其表示为 `S = "time#bell#"` 和 `indexes = [0, 2, 5]`。
    /// 
    /// 对于每一个索引，我们可以通过从字符串 `S` 中索引的位置开始读取字符串，直到 `"#"` 结束，来恢复我们之前的单词列表。
    /// 
    /// 那么成功对给定单词列表进行编码的最小字符串长度是多少呢？
    /// 
    /// - Parameter words:
    /// - Returns:
    func minimumLengthEncoding(_ words: [String]) -> Int {
        
        /** 超时，但是同思路的 PHP 和 Kotlin 就可以通过！很气！ */
        
        var resultString = ""
        
        // 按长度从长到短排序
        words.sorted { $0.count > $1.count }.forEach {
            
            let string = $0 + "#"
            
            if !resultString.contains(string) { 
                resultString += string
            }
        }
        
        return resultString.count
    }
    
    /**
     *  一开始想过用 Set 去重，但是后来用转成了数组，然后双重 for 循环 hasSuffix 判断后缀
     *  实际上可以直接用 Set 来做。
     *
     *  判断集合中的字符串，是否是数组中元素的后缀。
     *
     *  保留所有 **不是其他单词后缀的单词**
     */
    func minimumLengthEncoding2(_ words: [String]) -> Int {
        
        // 用 Set 去重
        var good = Set(words)
        
        for word in words {
            
            let start = word.startIndex
            let end = word.endIndex
            
            // 从 1 开始是为了 "只判断后缀"，避免了同字符串之间的比较
            for i in (1 ..< word.count).reversed() {
                good.remove(String(word[word.index(start, offsetBy: i) ..< end]))
            }
        }
        
        return good.reduce(0) { $0 + $1.count + 1 }
    }
    
    func minimumLengthEncoding3(_ words: [String]) -> Int {
        
        let trie = TrieNode()
        var nodes = [TrieNode: Int]()
        
        words.enumerated().forEach { (index, word) in
            var cur = trie
            word.reversed().forEach {
                cur = cur.get(character: $0)
            }
            print(cur)
            nodes[cur] = index
        }
        
        print(nodes)
        
        var ans = 0
        nodes.forEach { (trie, index) in
            if trie.count == 0 {
                ans += words[nodes[trie]!].count + 1
            }
        }
        return ans
    }
    
    func _820() {
        
        print(minimumLengthEncoding3(["time", "me", "bell"])) // 10
    }
}

class TrieNode: Hashable {
    
    var children: [TrieNode?] = [TrieNode?](repeating: nil, count: 26)
    var count: Int = 0
    
    func get(character c: Character) -> TrieNode {
        guard let cValue = c.asciiValue else {
            return self
        }
        let index = Int(cValue - Character("a").asciiValue!)
        if let child = children[index] {
            return child
        } else {
            children[index] = TrieNode()
            count += 1
            return children[index]!
        }
    }
    
    //MARK: - Hashable
    public static func == (lhs: TrieNode, rhs: TrieNode) -> Bool {
        let lhsPointer = Unmanaged.passUnretained(lhs).toOpaque()
        let rhsPointer = Unmanaged.passUnretained(rhs).toOpaque()
        return lhsPointer == rhsPointer
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(Unmanaged.passUnretained(self).toOpaque())
    }
}

