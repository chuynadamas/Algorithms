//: [Previous](@previous)

/*
 You are given a perfect binary tree where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:

 ```
 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 ```
 
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

 Initially, all next pointers are set to NULL.
 
 ```
 Input: root = [1,2,3,4,5,6,7]
 Output: [1,#,2,3,#,4,5,6,7,#]
 Explanation: Given the above perfect binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
 ```
 
 */

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
