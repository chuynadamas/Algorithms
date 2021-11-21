//: [Previous](@previous)

import Foundation
// Add any extra import statements you may need here

// Add any helper functions you may need here
private extension Array where Element == Int {
  func findPositions(n: Int, x: Int) -> [Int] {
    var original = self.map { $0 + x }
    var queue = self
    var result : [Int] = []
    var carry = 0
    
      for i in 0..<x {
        var popped : [Int] = []
        var popIndex = 0
        var maxPopped = Int.min
        var maxPoppedIndex = 0
        
        while popIndex < x && popIndex < queue.count {
          let number = queue.removeFirst()
          if number > maxPopped {
            maxPopped = number
            maxPoppedIndex = popIndex
          }
          popped.append(number)
        }
        
        result.append(original.firstIndex(of: maxPopped+x+carry) ?? 0)
        
        if maxPopped == 0 {
          carry += 1
        }
        
        popped.remove(at: maxPoppedIndex-1 )
        popped = popped.map { $0 > 1 ? $0-1 : $0}
      }
      return result
    }
}











// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

private var testCaseNumber = 1

private func check(_ expectedValue: [Int], matches output: [Int]) {
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
    
  let result = expectedValue == output
  if result {
    print("\(rightTick) Test #\(testCaseNumber)")
  } else {
    print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue) Your output: \(output)")
  }
  testCaseNumber += 1
}

let arr1 = [1, 2, 2, 3, 4, 5]
let expected1 = [5, 6, 4, 1, 2]
let output1 = arr1.findPositions(n: 6, x: 5)
check(expected1, matches: output1)

let arr2 = [2, 4, 2, 4, 3, 1, 2, 2, 3, 4, 3, 4, 4]
let expected2 = [2, 5, 10, 13]
//let output2 = arr2.findPositions(n: 13, x: 4)
//check(expected2, matches: output2)

// Add your test cases here

//: [Next](@next)
