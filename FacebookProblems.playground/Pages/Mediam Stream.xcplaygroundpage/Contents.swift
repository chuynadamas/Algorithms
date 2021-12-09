//: [Previous](@previous)

import Foundation

struct Heap<Element> {
    
    var elements: [Element]
    let priorityFunction: (Element, Element) -> Bool
    
    var count : Int { return elements.count }
    
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
    
    func peek() -> Element? {
        return elements.first
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

func findMedian(arr: [Int]) -> [Int] {
    
    /// right side
    var minHeap = Heap<Int>(elements: [], priorityFunction: <)
    /// left side
    var maxHeap = Heap<Int>(elements: [], priorityFunction: >)
    
    var result: [Int] = []
    
    for num in arr {
        if maxHeap.count == 0 || maxHeap.peek()! >= num {
            maxHeap.enqueue(num)
            if maxHeap.count > minHeap.count + 1 {
                minHeap.enqueue(maxHeap.dequeue()!)
            }
        } else {
            minHeap.enqueue(num)
            if minHeap.count > maxHeap.count {
                maxHeap.enqueue(minHeap.dequeue()!)
            }
        }
        
        let median: Int
        print("maxHeap: \(maxHeap.elements) minHeap: \(minHeap.elements)" )
        if maxHeap.count != minHeap.count {
            median = maxHeap.peek()!
        } else {
            median = (maxHeap.peek()! + minHeap.peek()!) / 2
        }
        
        result.append(median)
    }
    
    
    return result;
}

// [5, 10, 5, 4]
findMedian(arr:  [5, 15, 1, 3])

//: [Next](@next)
