//: [Previous](@previous)
/**
 
 Median Stream
 You're given a list of n integers arr[0..(n-1)]. You must compute a list output[0..(n-1)] such that, for each index i (between 0 and n-1, inclusive), output[i] is equal to the median of the elements arr[0..i] (rounded down to the nearest integer).
 
 The median of a list of integers is defined as follows. If the integers were to be sorted, then:
 If there are an odd number of integers, then the median is equal to the middle integer in the sorted order.
 Otherwise, if there are an even number of integers, then the median is equal to the average of the two middle-most integers in the sorted order.
 Signature
 int[] findMedian(int[] arr)
 
 Input
 n is in the range [1, 1,000,000].
 Each value arr[i] is in the range [1, 1,000,000].
 
 Output
 Return a list of n integers output[0..(n-1)], as described above.
 
 Example 1
 n = 4
 arr = [5, 15, 1, 3]
 output = [5, 10, 5, 4]
 The median of [5] is 5, the median of [5, 15] is (5 + 15) / 2 = 10, the median of [5, 15, 1] is 5, and the median of [5, 15, 1, 3] is (3 + 5) / 2 = 4.
 
 Example 2
 n = 2
 arr = [1, 2]
 output = [1, 1]
 The median of [1] is 1, the median of [1, 2] is (1 + 2) / 2 = 1.5 (which should be rounded down to 1).
 

 */
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
