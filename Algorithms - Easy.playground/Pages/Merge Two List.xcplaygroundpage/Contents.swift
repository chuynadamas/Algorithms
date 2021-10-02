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

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var nodeL1 = l1
    var nodeL2 = l2
    
    let newHead : ListNode? = ListNode(0)
    var newNode = newHead
    
    while nodeL1 != nil || nodeL2 != nil {
        if  let val1 = nodeL1?.val {
            if let val2 = nodeL2?.val {
                if val1 < val2 {
                    //add the node in the list 1
                    newNode?.next = nodeL1
                    nodeL1 = nodeL1?.next
                } else {
                    //add the node in the list 2
                    newNode?.next = nodeL2
                    nodeL2 = nodeL2?.next
                }
            } else {
                //nodeL2 is already empty
                newNode?.next = nodeL1
                return newHead?.next
            }
        } else {
            //nodeL1 is already empty
            newNode?.next = nodeL2
            return newHead?.next
        }
        //move the node in the new list
        newNode = newNode?.next
    }
    return newHead?.next
}

let node_1 = ListNode(1)
let node_2 = ListNode(2)
let node_3 = ListNode(4)

let node_4 = ListNode(1)
let node_5 = ListNode(3)
let node_6 = ListNode(4)

node_1.next = node_2
node_2.next = node_3

node_4.next = node_5
node_5.next = node_6

mergeTwoLists(node_1, node_4)
//: [Next](@next)
