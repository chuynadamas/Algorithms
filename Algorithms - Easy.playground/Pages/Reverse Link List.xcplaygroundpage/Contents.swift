//: [Previous](@previous)

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    // return reverseList_Iter(head)
    return reverseList_TD(head, nil)
}

func reverseList_TD(_ node: ListNode?, _ prev: ListNode?) -> ListNode? {
    if node == nil {
        return prev // New head
    }
    let next = node!.next
    node!.next = prev
    return reverseList_TD(next, node)
}

func reverseList_Iter(_ head: ListNode?) -> ListNode? {
    var prev: ListNode?
    var node = head
    while node != nil {
        let next = node!.next
        node!.next = prev
        prev = node
        node = next
    }
    return prev // New head
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

reverseList(node_1)

//: [Next](@next)
