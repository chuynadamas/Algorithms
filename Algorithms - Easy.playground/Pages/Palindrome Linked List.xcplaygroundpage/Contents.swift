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
let node_2 = ListNode(2)
let node_3 = ListNode(2)
let node_4 = ListNode(1)

node_1.next = node_2
node_2.next = node_3
node_3.next = node_4


var frontPointer: ListNode? = nil
 
func isPalindrome(_ head: ListNode?) -> Bool {
    frontPointer = head
    return recursivelyCheck(head)
}

func recursivelyCheck(_ currentNode: ListNode?) -> Bool {
    if currentNode != nil {
        if !recursivelyCheck(currentNode?.next)  { return false }
        if currentNode?.val != frontPointer?.val { return false }
        frontPointer = frontPointer?.next
    }
    return true
}

func printValuesInReverse(_ head: ListNode?) {
    if head != nil {
        printValuesInReverse(head?.next)
        print(head?.val ?? "")
    }
}

isPalindrome(node_1)
printValuesInReverse(node_1)





//: [Next](@next)
