//: [Previous](@previous)

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
    
struct Queue<T> {
    var elements: [T] = []
    
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }
    
    mutating func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }
    
    var head: T? {
        return elements.first
    }
    
    var tail: T? {
        return elements.last
    }
}
    
var result : [[Int]] = []

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var queue = Queue<TreeNode?>()
    queue.enqueue(root)
    appendAndQueue(queue)
    
    return result
}

func appendAndQueue(_ queue: Queue<TreeNode?>) {
    var newQueue = Queue<TreeNode?>()
    var newArray : [Int] = []
    
    for element in queue.elements {
        if let value = element?.val { newArray.append(value) }
        if let leftValue = element?.left {newQueue.enqueue(leftValue) }
        if let rightValue = element?.right {newQueue.enqueue(rightValue) }
    }
    
    if !newArray.isEmpty { result.append(newArray) }
    if !newQueue.elements.isEmpty { appendAndQueue(newQueue) }
}


//: [Next](@next)
