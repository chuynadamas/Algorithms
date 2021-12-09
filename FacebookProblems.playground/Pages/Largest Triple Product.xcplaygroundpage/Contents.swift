//: [Previous](@previous)
/*
 Largest Triple Products
 You're given a list of n integers arr[0..(n-1)]. You must compute a list output[0..(n-1)] such that, for each index i (between 0 and n-1, inclusive), output[i] is equal to the product of the three largest elements out of arr[0..i] (or equal to -1 if i < 2, as arr[0..i] then includes fewer than three elements).
 Note that the three largest elements used to form any product may have the same values as one another, but they must be at different indices in arr.
 
 Signature
 int[] findMaxProduct(int[] arr)
 
 Input
 
 n is in the range [1, 100,000].
 Each value arr[i] is in the range [1, 1,000].
 
 Output
 
 Return a list of n integers output[0..(n-1)], as described above.
 
 Example 1
 n = 5
 arr = [1, 2, 3, 4, 5]
 output = [-1, -1, 6, 24, 60]
 
 The 3rd element of output is 3*2*1 = 6, the 4th is 4*3*2 = 24, and the 5th is 5*4*3 = 60.
 
 Example 2
 n = 5
 arr = [2, 1, 2, 1, 2]
 output = [-1, -1, 4, 4, 8]
 The 3rd element of output is 2*2*1 = 4, the 4th is 2*2*1 = 4, and the 5th is 2*2*2 = 8.
 
 */

import Foundation

struct Heap<Element> {
    
    var elements: [Element]
    let priorityFunction: (Element, Element) -> Bool
    
    private var count : Int { return elements.count }
    
    init(elements: [Element] = [],
         priorityFunction: @escaping (Element, Element) -> Bool) {
        
        self.elements = elements
        self.priorityFunction = priorityFunction
        
        buildHeap()
    }
    
    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            heapifyDown(elementAtIndex: index)
        }
    }
    
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction( elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)),
                                    and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, secondIndex: Int) {
        guard firstIndex != secondIndex else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
    
    mutating func heapifyUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index),
              isHigherPriority(at: index, than: parent) else { return }
        
        swapElement(at: index, secondIndex: parent)
        heapifyUp(elementAtIndex: parent)
    }
    
    mutating func heapifyDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex {
            return
        }
        swapElement(at: index, secondIndex: childIndex)
        heapifyDown(elementAtIndex: childIndex)
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        heapifyUp(elementAtIndex: count - 1)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else { return nil }
        swapElement(at: 0, secondIndex: count - 1)
        let element = elements.removeLast()
        if !elements.isEmpty {
            heapifyDown(elementAtIndex: 0)
        }
        return element
    }
    
}



func findMaxProduct(arr: [Int]) -> [Int] {
    var heap = Heap<Int>(elements: Array(arr[...1]), priorityFunction: >)
    var result = [-1,-1]
    
    for index in 2..<arr.count {
        heap.enqueue(arr[index])
        
        let one = heap.dequeue()!
        let two = heap.dequeue()!
        let three = heap.dequeue()!
        
        result.append(one*two*three)
        
        heap.enqueue(one)
        heap.enqueue(two)
        heap.enqueue(three)
    }
    
    return result;
}


findMaxProduct(arr:[1, 2, 3, 4, 5])

//: [Next](@next)
