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
    var current = root
    while current?.left != nil {
        let nextLevel = current?.left
        while current != nil {
            current?.left?.next = current?.right
            if current?.next == nil {
                //There is no more nodes to the right
                current?.right?.next = nil
            } else {
                //Look in the upper level the next node
                current?.right?.next = current?.next?.left
            }
            current = current?.next
        }
        current = nextLevel
    }
    return root
}

//: [Next](@next)
