import Foundation

public class TrieNode: Hashable {
    
    public init() {}
    
    public var children: [TrieNode?] = [TrieNode?](repeating: nil, count: 26)
    public var count: Int = 0
    
    public func get(character c: Character) -> TrieNode {
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
