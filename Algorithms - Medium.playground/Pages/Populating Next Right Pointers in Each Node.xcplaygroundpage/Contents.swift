//: [Previous](@previous)

import Foundation

/// Definition for a binary tree node.
public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

func connect(_ root: Node?) -> Node? {
    guard root != nil else {
        return root
    }
    
    var leftNode = root
    while leftNode?.left != nil {
        var head = leftNode
        while head != nil {
            head?.right?.next = head?.next?.left
            if head?.next != nil {
                head?.right?.next = head?.next?.left
            }
            head = head?.next
        }
        leftNode = leftNode?.left
    }
    
    return root
}

//: [Next](@next)
