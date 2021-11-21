//: [Previous](@previous)

import Foundation
// Add any extra import statements you may need here


// Add any helper functions you may need here


struct GrowthRates {
  let rates: [Double]
}

private extension GrowthRates {
  func daysUntilBillionUsers() -> Int {
    // Write your code here
    var result = 0
    var days = 0
    
    while result < 1000000000 {
      var daySum = 0
      days += 1
      for rate in rates {
        let usersPerAppOnDay = pow(Decimal(rate), days)
        daySum += (usersPerAppOnDay as NSDecimalNumber).intValue
      }
      result = daySum
    }
    return days
  }
}



// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

var testCaseNumber = 1

private func check(_ expectedValue: Int, matches output: Int) {
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

let rates1 = GrowthRates(rates: [1.1, 1.2, 1.3])
check(79, matches: rates1.daysUntilBillionUsers())

let rates2 = GrowthRates(rates: [1.01, 1.02])
check(1047, matches: rates2.daysUntilBillionUsers())

// Add your own test cases here
let rates3 = GrowthRates(rates: [1.5])
check(52, matches: rates3.daysUntilBillionUsers())

let rates4 = GrowthRates(rates: [1.1, 1.2, 1.3])
check(79, matches: rates4.daysUntilBillionUsers())

//: [Next](@next)
