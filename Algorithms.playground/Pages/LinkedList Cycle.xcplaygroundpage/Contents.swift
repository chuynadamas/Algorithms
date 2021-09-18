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

let node_1 = ListNode(1)
let node_2 = ListNode(1)
let node_3 = ListNode(1)
let node_4 = ListNode(1)

node_1.next = node_2
node_2.next = node_3
node_3.next = node_4
node_4.next = node_1


func hasCycle(_ head: ListNode?) -> Bool {
    var stepOnePointer = head
    var stepTwoPointer = head
    
    while stepOnePointer != nil && stepTwoPointer != nil {
        if ObjectIdentifier(stepOnePointer!) == ObjectIdentifier(stepTwoPointer!) {
            return true
        }
        stepOnePointer = stepOnePointer?.next
        stepTwoPointer = stepTwoPointer?.next?.next
    }
    return false
}

func hasCycleL(_ head: ListNode?) -> Bool {
    var slow = head
    var fast = head?.next
    
    while let currentSlow = slow,
          let currentFast = fast,
          currentSlow !== currentFast {
            slow = currentSlow.next
            fast = currentFast.next?.next
    }
    
    return fast != nil
}

hasCycle(node_1)

//: [Next](@next)
