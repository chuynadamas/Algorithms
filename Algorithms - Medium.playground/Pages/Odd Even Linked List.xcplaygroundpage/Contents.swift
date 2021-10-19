//: [Previous](@previous)

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


let node_1 = ListNode(1)
let node_2 = ListNode(2)
let node_3 = ListNode(3)
let node_4 = ListNode(4)
let node_5 = ListNode(5)

node_1.next = node_2
node_2.next = node_3
node_3.next = node_4
node_4.next = node_5


func oddEvenList(_ head: ListNode?) -> ListNode? {
    guard head != nil else {
        return head
    }
    
    var oddHead = head
    var evenHead = head?.next
    let even = evenHead
    
    while evenHead != nil && evenHead?.next != nil {
        oddHead?.next = evenHead?.next
        oddHead = oddHead?.next
        evenHead?.next = oddHead?.next
        evenHead = evenHead?.next
    }
    
    oddHead?.next = even
    return head
}




//: [Next](@next)
