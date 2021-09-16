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

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let newRoot = ListNode(0)
    newRoot.next = head
    
    var previosNodeToDelete : ListNode? = newRoot
    var offsetNode : ListNode? = newRoot

    for _ in 0..<n {
        offsetNode = offsetNode?.next
    }

    while offsetNode?.next != nil {
        previosNodeToDelete = previosNodeToDelete?.next
        offsetNode = offsetNode?.next
    }

    //This is the last element
    previosNodeToDelete?.next = previosNodeToDelete?.next?.next
    return newRoot.next
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

removeNthFromEnd(node_1, 1)


//: [Next](@next)
