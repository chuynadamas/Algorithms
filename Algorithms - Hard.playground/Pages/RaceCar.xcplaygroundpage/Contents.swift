//: [Previous](@previous)

import Foundation

func racecar(_ target: Int) -> Int {
    
    var dp:[Int:Int] = [0:0]
    
    for i in 1..<target + 1 {
        
        let num = log2(Double(i+1))
        
        if num == Double(Int(num)) {
            
            dp[i] = Int(num)
            
        } else {
            
            for j in 0..<Int(num){
                let a = i - (1<<Int(num)-1) + (1<<j) - 1
                if a >= 0{
                    dp[i] = dp[i] == nil ? Int(num)+j+2+dp[a]! : min(dp[i]!, Int(num)+j+2+dp[a]!)
                }
            }
            
            dp[i] = min(dp[i]!, Int(num+1) + 1 + dp[(1<<Int(num+1))-1-i]!)
        }
    }
    return dp[target]!
}


racecar(6)

//: [Next](@next)
