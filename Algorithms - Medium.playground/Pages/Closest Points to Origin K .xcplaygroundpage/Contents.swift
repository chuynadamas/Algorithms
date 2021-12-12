//: [Previous](@previous)
/**
 Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane and an integer k, return the k closest points to the origin (0, 0).

 The distance between two points on the X-Y plane is the Euclidean distance (i.e., √(x1 - x2)2 + (y1 - y2)2).

 You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in).

  

 Example 1:


 Input: points = [[1,3],[-2,2]], k = 1
 Output: [[-2,2]]
 Explanation:
 The distance between (1, 3) and the origin is sqrt(10).
 The distance between (-2, 2) and the origin is sqrt(8).
 Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
 We only want the closest k = 1 points from the origin, so the answer is just [[-2,2]].
 Example 2:

 Input: points = [[3,3],[5,-1],[-2,4]], k = 2
 Output: [[3,3],[-2,4]]
 Explanation: The answer [[-2,4],[3,3]] would also be accepted.
  

 Constraints:

 1 <= k <= points.length <= 104
 -104 < xi, yi < 104
 
 */
import Foundation

struct Heap<Element> {
    
    var elements: [Element]
    let priorityFunction: (Element, Element) -> Bool
    
    var count : Int { elements.count }
    
    init(_ elements: [Element] = [],
         _ priorityFunction: @escaping (Element, Element) -> Bool) {
        
        self.elements = elements
        self.priorityFunction = priorityFunction
        
        buildHeap()
    }
    
    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            heapifyDown(index)
        }
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    func leftChildIndex(_ index: Int) -> Int {
        return (2*index) + 1
    }
    
    func rightChildIndex(_ index: Int) -> Int {
        return (2*index) + 2
    }
    
    func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(_ firstIndex: Int,_ secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex],elements[secondIndex])
    }
    
    func highestPriorityIndex(_ parentIndex: Int, _ childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(childIndex, parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    
    func highestPriorityIndex(_ parentIndex: Int) -> Int {
        return highestPriorityIndex(highestPriorityIndex(parentIndex,
                                                         leftChildIndex(parentIndex)),
                                    highestPriorityIndex(parentIndex,
                                                         rightChildIndex(parentIndex)))
    }
    
    mutating func swapElements(_ firsIndex: Int, _ secondIndex: Int) {
        guard firsIndex != secondIndex else { return }
        elements.swapAt(firsIndex, secondIndex)
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        heapifyUp(count-1)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else { return nil }
        swapElements(0,count-1)
        
        let element = elements.removeLast()
        if !elements.isEmpty {
            heapifyDown(0)
        }
        return element
    }
    
    mutating func heapifyUp(_ index: Int) {
        let parent = parentIndex(index)
        guard !isRoot(parent),
              isHigherPriority(index, parent) else {
                  return
              }
        swapElements(parent,index)
        heapifyUp(parent)
    }
    
    mutating func heapifyDown(_ index: Int) {
        let childIndex = highestPriorityIndex(index)
        if childIndex == index {
            return
        }
        swapElements(index,childIndex)
        heapifyDown(childIndex)
    }
    
}

func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    
    let priorityFunction: ([Int],[Int]) -> Bool = {
        let firstDistance = sqrt(Double(($0[0]*$0[0])+($0[1]*$0[1])))
        let secondDistance = sqrt(Double(($1[0]*$1[0])+($1[1]*$1[1])))
        return firstDistance < secondDistance
    }
    
    var heap: Heap<[Int]> = Heap(points, priorityFunction)
    
    var result : [[Int]] = []
    for _ in 0..<k {
        result.append(heap.dequeue()!)
    }
    
    return result
}


kClosest([[1,3],[-2,2]],1)
//: [Next](@next)
