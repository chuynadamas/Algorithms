//: [Previous](@previous)

import Foundation

/// Definition for singly-linked list.

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1: ListNode? = l1
    var l2: ListNode? = l2
    
    var result: ListNode? = ListNode(0)
    let head = result
    
    var carry = 0
    while l1 != nil || l2 != nil || carry > 0 {
        let firstValue = l1?.val ?? 0
        let secondValue = l2?.val ?? 0
        let sum = firstValue + secondValue + carry
        
        let value = sum % 10
        carry = sum / 10
        
        result?.next = ListNode(value)
        result = result?.next
        l1 = l1?.next
        l2 = l2?.next
    }
    
    return head?.next
}


let node_1 = ListNode(2)
let node_2 = ListNode(4)
let node_3 = ListNode(3)

node_1.next = node_2
node_2.next = node_3

let node_4 = ListNode(5)
let node_5 = ListNode(6)
let node_6 = ListNode(4)

node_4.next = node_5
node_5.next = node_6


addTwoNumbers(node_1, node_4)


//: [Next](@next)
