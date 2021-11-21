//: [Previous](@previous)

// Add any extra import statements you may need here


// Add any helper functions you may need here


private extension Array where Element == Int {
  var hasBalancedSplit: Bool {
    // Write your code here
    if self.isEmpty {
      return false
    }
    
    var sortedArray = self
    sortedArray.sort()
    
    var pointer = sortedArray.count/2
    var prevPointer = -1
    
    while pointer < sortedArray.count && pointer > 0 && prevPointer != pointer  {
      
      let leftSlice = sortedArray[0 ..< pointer]
      let rightSlice = sortedArray[pointer ..< sortedArray.count]

      let leftSum = leftSlice.reduce(0, +)
      let rightSum = rightSlice.reduce(0, +)

      if leftSum == rightSum {
        if leftSlice.last != rightSlice.first {
          return true
        } else {
          return false
        }
      } else {
        prevPointer = pointer
        
        if leftSum < rightSum {
          pointer += 1
        } else {
          pointer -= 1
        }
        
      }
    }
    return false
  }
}


// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

var testCaseNumber = 1

private func check(_ expectedValue: Bool, matches output: Bool) {
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

let arr1 = [2, 1, 5, 2]
check(true, matches: arr1.hasBalancedSplit)

let arr2 = [3, 6, 3, 4, 4]
check(false, matches: arr2.hasBalancedSplit)

// Add your own test cases here
let arr3 = [1, 2, 3]
check(true, matches: arr3.hasBalancedSplit)

let arr4 = [1, 2]
check(false, matches: arr4.hasBalancedSplit)

let arr5 = [12, 7, 6, 7, 6]
check(false, matches: arr5.hasBalancedSplit)

//: [Next](@next)
