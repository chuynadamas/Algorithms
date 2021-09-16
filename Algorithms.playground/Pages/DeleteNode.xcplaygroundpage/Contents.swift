//: [Previous](@previous)

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func deleteNode(_ node: ListNode?) {
        guard let nodeToDelete = node else { return }
        
        nodeToDelete.val = nodeToDelete.next!.val
        nodeToDelete.next = nodeToDelete.next?.next
    }
}
//: [Next](@next)
