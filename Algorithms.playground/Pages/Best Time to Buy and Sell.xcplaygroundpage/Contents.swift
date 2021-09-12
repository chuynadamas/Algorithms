//: [Previous](@previous)

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 1 else {
        return 0
    }
    var profit = 0
    
    for day in 1..<prices.count {
        //The summ of all the differences is equal than the biggest difference.
        let partialProfit = prices[day] - prices[day-1]
        if  partialProfit > 0 {
            profit += partialProfit
        }
    }
    return profit
}

maxProfit([7,1,5,3,6,4])
//: [Next](@next)
