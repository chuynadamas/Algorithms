//: [Previous](@previous)

/*
 Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.

 For example, the following two linked lists begin to intersect at node c1:


 The test cases are generated such that there are no cycles anywhere in the entire linked structure.

 Note that the linked lists must retain their original structure after the function returns.

 Custom Judge:

 The inputs to the judge are given as follows (your program is not given these inputs):

 intersectVal - The value of the node where the intersection occurs. This is 0 if there is no intersected node.
 listA - The first linked list.
 listB - The second linked list.
 skipA - The number of nodes to skip ahead in listA (starting from the head) to get to the intersected node.
 skipB - The number of nodes to skip ahead in listB (starting from the head) to get to the intersected node.
 The judge will then create the linked structure based on these inputs and pass the two heads, headA and headB to your program. If you correctly return the intersected node, then your solution will be accepted.
 
 
 ```
 Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
 Output: Intersected at '8'
 Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect).
 From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,6,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.
 ```
 */


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
