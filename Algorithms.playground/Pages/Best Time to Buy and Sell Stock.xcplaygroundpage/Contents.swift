//: [Previous](@previous)

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit = Int.min
    var minPrice = Int.max
    
    for n in 0..<prices.count {
        if prices[n] < minPrice {
            minPrice = prices[n]
        }
        if maxProfit < (prices[n] - minPrice) {
            maxProfit = prices[n] - minPrice
        }
    }
    return maxProfit
}


maxProfit([7,1,5,3,6,4])

//: [Next](@next)
