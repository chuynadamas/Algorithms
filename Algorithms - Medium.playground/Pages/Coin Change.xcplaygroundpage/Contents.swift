//: [Previous](@previous)

import Foundation

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dp : [Int] = Array.init(repeating: amount+1, count: amount+1)

    dp[0] = 0
    var coins = coins
    coins.sort()

    for i in 0...amount {
        for j in 0..<coins.count {
            if coins[j] <= i {
                dp[i] = min(dp[i], 1 + dp[i - coins[j]])
            } else {
                break
            }
        }
    }
    
    return dp[amount] > amount ? -1 : dp[amount]
}


coinChange([1,2,5], 11)


//: [Next](@next)
