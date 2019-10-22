//: [Previous](@previous)

import Foundation

/**
 *  - 题目：
 *
 *  给定一个字符串和一个字符串字典，找到字典里面最长的字符串，该字符串可以通过删除给定字符串的某些字符来得到。
 *  如果答案不止一个，返回长度最长且字典顺序最小的字符串。如果答案不存在，则返回空字符串。
 *
 *  - 示例：
 *
 *  1. 输入: s = "abpcplea", d = ["ale","apple","monkey","plea"]，输出："apple"
 *  2. 输入: s = "abpcplea", d = ["a","b","c"]，输出："a"
 *
 *  - 说明:
 *
 *  1. 所有输入的字符串只包含小写字母。
 *  2. 字典的大小不会超过 1000。
 *  3. 所有输入的字符串长度不会超过 1000。
 */
class Solution {

    /* 测试用例 */
    let testOne = (s : "abpcplea", d : ["ale","apple","monkey","plea"]) // apple
    let testTwo = (s : "abpcplea", d : ["a","b","c","d"]) // a
    let testThr = (s : "apple", d : ["zxc","vbn"]) // ""
    let testFou = (s : "bab", d : ["ba","ab","a","b"]) // ab
    let testFiv = (s : "aewfafwafjlwajflwajflwafj", d : ["apple","ewaf","awefawfwaf","awef","awefe","ewafeffewafewf"]) // ewaf
    let testSix = (s : "", d : ["b","a"]) // ""
    let testSev = (s : "wsmzffsupzgauxwokahurhhikapmqitytvcgrfpavbxbmmzdhnrazartkzrnsmoovmiofmilihynvqlmwcihkfskwozyjlnpkgdkayioieztjswgwckmuqnhbvsfoevdynyejihombjppgdgjbqtlauoapqldkuhfbynopisrjsdelsfspzcknfwuwdcgnaxpevwodoegzeisyrlrfqqavfziermslnlclbaejzqglzjzmuprpksjpqgnohjjrpdlofruutojzfmianxsbzfeuabhgeflyhjnyugcnhteicsvjajludwizklkkosrpvhhrgkzctzwcghpxnbsmkxfydkvfevyewqnzniofhsriadsoxjmsswgpiabcbpdjjuffnbvoiwotrbvylmnryckpnyemzkiofwdnpnbhkapsktrkkkakxetvdpfkdlwqhfjyhvlxgywavtmezbgpobhikrnebmevthlzgajyrmnbougmrirsxi", d: ["jpthiudqzzeugzwwsngebdeai", "nbmxgkduynigvzuyblwjepn"]) // nbmxgkduynigvzuyblwjepn
    let testEig = (s : "mjmqqjrmzkvhxlyruonekhhofpzzslupzojfuoztvzmmqvmlhgqxehojfowtrinbatjujaxekbcydldglkbxsqbbnrkhfdnpfbuaktupfftiljwpgglkjqunvithzlzpgikixqeuimmtbiskemplcvljqgvlzvnqxgedxqnznddkiujwhdefziydtquoudzxstpjjitmiimbjfgfjikkjycwgnpdxpeppsturjwkgnifinccvqzwlbmgpdaodzptyrjjkbqmgdrftfbwgimsmjpknuqtijrsnwvtytqqvookinzmkkkrkgwafohflvuedssukjgipgmypakhlckvizmqvycvbxhlljzejcaijqnfgobuhuiahtmxfzoplmmjfxtggwwxliplntkfuxjcnzcqsaagahbbneugiocexcfpszzomumfqpaiydssmihdoewahoswhlnpctjmkyufsvjlrflfiktndubnymenlmpyrhjxfdcq", d : ["ettphsiunoglotjlccurlre", "ntgcykxhdfescxxypyew"]) // ntgcykxhdfescxxypyew
}

// MARK: -

extension Solution {
    
    func findLongestWord(_ s: String, _ d: [String]) -> String {
        
        guard !d.isEmpty && !s.isEmpty else { return "" }
        
        var contains: [String] = d.filter { s.contains($0) }
        
        if contains.count != d.count {

            // 其余不包含的内容
            let notContains: [String] = d.filter { !s.contains($0) }

            for string in notContains {

                var index = 0
                var subS = s
                
                for char in string {
                    
                    // 不包含，就检索下个字符串
                    guard let tmpIndex = subS.firstIndex(of: char) else { break }

                    if index == string.count - 1 {
                        contains.append(string)
                        break
                    }
                    
                    index += 1
                    subS = String(subS[subS.index(after: tmpIndex) ..< subS.endIndex])
                }
            }
        }

        guard !contains.isEmpty else { return "" }
        
        var maxLengthStrings: [String] = []
        var maxLength = 0

        contains.forEach {

            if $0.count > maxLength {
                maxLengthStrings = [$0]
                maxLength = $0.count

            } else if $0.count == maxLength {
                maxLengthStrings.append($0)
            }
        }

        var maxLengthString = maxLengthStrings.first!

        if maxLengthStrings.count == 1 {
            return maxLengthString
        }

        maxLengthStrings.forEach {
            if $0 < maxLengthString { maxLengthString = $0 }
        }

        return maxLengthString
    }

    func runTest() {
        
        findLongestWord(testOne.s, testOne.d)
        findLongestWord(testTwo.s, testTwo.d)
        findLongestWord(testThr.s, testThr.d)
        findLongestWord(testFou.s, testFou.d)
        findLongestWord(testFiv.s, testFiv.d)
        findLongestWord(testSix.s, testSix.d)
        findLongestWord(testSev.s, testSev.d)
        findLongestWord(testEig.s, testEig.d)
    }
}

Solution().runTest()

//: [Next](@next)
