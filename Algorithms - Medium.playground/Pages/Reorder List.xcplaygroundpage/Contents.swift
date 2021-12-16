//: [Previous](@previous)

/**
 You are given the head of a singly linked-list. The list can be represented as:

 L0 → L1 → … → Ln - 1 → Ln
 Reorder the list to be on the following form:

 L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
 You may not modify the values in the list's nodes. Only nodes themselves may be changed.

  

 Example 1:


 Input: head = [1,2,3,4]
 Output: [1,4,2,3]
 Example 2:


 Input: head = [1,2,3,4,5]
 Output: [1,5,2,4,3]
  
 Constraints:

 The number of nodes in the list is in the range [1, 5 * 104].
 1 <= Node.val <= 1000
 
 */
import Foundation

func reorderList(_ head: ListNode?) {
    // nil <- 1          2 <- 3
    //  |     |          |
    // prev  current     tmp
    
    
    // nil <- 1          2 <- 3
    //        |          |
    //      current      tmp
    //       prev
    
    // nil <- 1          2 <- 3
    //        |          |
    //       prev       tmp
    //                  current
     
    var slow = head
    var fast = head?.next
    
    while fast != nil  && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    
    var current: ListNode? = slow?.next
    slow?.next = nil
    var prev: ListNode? = nil
    
    while current != nil {
        var tmp = current?.next
        current?.next = prev
        prev = current
        current = tmp
    }
    
    var first = head
    var second = prev
    
    while second != nil {
        var tmp1 = first?.next
        var tmp2 = second?.next
        first?.next = second
        second?.next = tmp1
        first = tmp1
        second = tmp2
    }
}

//: [Next](@next)
