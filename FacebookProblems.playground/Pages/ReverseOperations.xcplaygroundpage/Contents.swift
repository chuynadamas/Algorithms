//: [Previous](@previous)
/**
 
 Reverse Operations
 You are given a singly-linked list that contains N integers. A subpart of the list is a contiguous set of even elements, bordered either by either end of the list or an odd element. For example, if the list is [1, 2, 8, 9, 12, 16], the subparts of the list are [2, 8] and [12, 16].
 Then, for each subpart, the order of the elements is reversed. In the example, this would result in the new list, [1, 8, 2, 9, 16, 12].
 The goal of this question is: given a resulting list, determine the original order of the elements.
 
 Implementation detail:
 
 You must use the following definition for elements in the linked list:
 class Node {
     int data;
     Node next;
 }
 
 Signature
 Node reverse(Node head)
 Constraints
 1 <= N <= 1000, where N is the size of the list
 1 <= Li <= 10^9, where Li is the ith element of the list
 Example
 Input:
 N = 6
 list = [1, 2, 8, 9, 12, 16]
 Output:
 [1, 8, 2, 9, 16, 12]
 
 */
import Foundation
// Add any extra import statements you may need here

// Add any helper functions you may need here
func isOdd(_ node: Node?) -> Bool {
  if let nodeValue = node,
      nodeValue.data > 1 {
        return nodeValue.data % 2 == 0
  } else {
    return false
  }
}

func revertList(_ head: Node?) -> Node? {
  var previousNode: Node? = nil
  var currentNode = head
  var nextNode = head?.nextNode
   
  //print(head?.data)
  while nextNode != nil {
    //print(nextNode?.data)
    currentNode?.nextNode = previousNode
    previousNode = currentNode
    currentNode = nextNode
    nextNode = currentNode?.nextNode
  }
  currentNode?.nextNode = previousNode
  return currentNode
}


class Node {
  var data: Int
  var nextNode: Node?
    
  init(data: Int, next: Node? = nil) {
    self.data = data
    self.nextNode = next
  }
}

private extension Node {
  func reverse() -> Node {
    // Write your code here
    var pointer : Node? = Node(data:0, next: self)
    
    while pointer != nil {
      
      if isOdd(pointer?.nextNode) {
        
        //append node to the list and later reverse
        var tail : Node? = pointer
        var temp : Node? = pointer?.nextNode
        
        while isOdd(temp) {
          tail = temp
          temp = temp?.nextNode
        }
        
        tail?.nextNode = nil
        pointer?.nextNode = revertList(pointer?.nextNode)
        
        while pointer?.nextNode != nil {
          pointer = pointer?.nextNode
        }
        
        pointer?.nextNode = temp
        
      } else {
        pointer = pointer?.nextNode
      }
    }
    
    return self
  }
}

// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

struct NodeView: IteratorProtocol {
  var node: Node?
  mutating func next() -> Int? {
    defer { node = node?.nextNode }
    return node?.data
  }
}
 
extension Node: Sequence {
  typealias Element = Int
  func makeIterator() -> NodeView {
    return NodeView(node: self)
  }
}

private extension Node {
  static func from(array: [Int]) -> Node {
    var array = array
    var tail = Node(data: array.removeLast())
    for num in array.reversed() {
      tail = Node(data: num, next: tail)
    }
    return tail
  }
}

extension Node: Equatable {
  static func == (lhs: Node, rhs: Node) -> Bool {
    return Array(lhs) == Array(rhs)
  }
}

var testCaseNumber = 1

func check(_ expectedHead: Node, matches outputHead: Node) {
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
    
  if expectedHead == outputHead {
    print("\(rightTick) Test #\(testCaseNumber)")
  } else {
    print("\(wrongTick) Test #\(testCaseNumber) Expected: \(Array(expectedHead)) Your output: \(Array(outputHead))")
  }
  testCaseNumber += 1
}

let head1 = Node.from(array: [1, 2, 8, 9, 12, 16])
let expected1 = Node.from(array: [1, 8, 2, 9, 16, 12])
let output1 = head1.reverse()
check(expected1, matches: output1)

let head2 = Node.from(array: [2, 18, 24, 3, 5, 7, 9, 6, 12])
let expected2 = Node.from(array: [24, 18, 2, 3, 5, 7, 9, 12, 6])
let output2 = head2.reverse()
check(expected2, matches: output2)

// Add your tests here
let head3 = Node.from(array: [1, 2, 8])
let expected3 = Node.from(array: [1, 8, 2])
let output3 = head3.reverse()
check(expected3, matches: output3)

let head4 = Node.from(array: [1, 2, 8, 9, 12, 16])
let expected4 = Node.from(array: [1, 8, 2, 9, 16, 12])
let output4 = head4.reverse()
check(expected4, matches: output4)

//: [Next](@next)
