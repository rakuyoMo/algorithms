import Foundation

public class ListNode {
    
    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    /// 使用数组进行初始化
    public init?(_ vals: [Int]) {
        
        guard !vals.isEmpty else { return nil }
        
        let node = ListNode(vals[0])
        
        var next: ListNode? = node
        
        for i in 1 ..< vals.count {
            
            next!.next = ListNode(vals[i])
            next = next!.next
        }
        
        self.val = vals[0]
        self.next = node.next
    }
}
