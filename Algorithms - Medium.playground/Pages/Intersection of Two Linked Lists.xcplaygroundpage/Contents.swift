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
let node_2 = ListNode(9)
let node_3 = ListNode(1)
let node_4 = ListNode(2)
let node_5 = ListNode(4)

let node_6 = ListNode(3)

node_1.next = node_2
node_2.next = node_3
node_3.next = node_4
node_4.next = node_5

node_6.next = node_4

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var lenA = 0
    var lenB = 0
    var tempA = headA
    var tempB = headB
    
    while tempA != nil {
        tempA = tempA?.next
        lenA += 1
    }
    
    while tempB != nil {
        tempB = tempB?.next
        lenB += 1
    }
    
    let diff = abs(lenA - lenB)
    tempA = headA
    tempB = headB
    
    if lenA > lenB {
        for _ in 0..<diff {
            tempA = tempA?.next
        }
    } else {
        for _ in 0..<diff {
            tempB = tempB?.next
        }
    }
    
    while tempA !== tempB {
        tempA = tempA?.next
        tempB = tempB?.next
        if tempA == nil || tempB == nil {
            return nil
        }
    }
    
    return tempA
}

getIntersectionNode(node_1, node_6)

//: [Next](@next)
