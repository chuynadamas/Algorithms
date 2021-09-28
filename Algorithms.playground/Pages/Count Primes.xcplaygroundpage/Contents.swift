//: [Previous](@previous)

import Foundation

func countPrimes(_ n: Int) -> Int {
    if n <= 3 { return 0 }
    var isPrime : [Bool] = Array(repeatElement(true, count: n))
    
    let root = Double(n).squareRoot()
    let limit = Int(root)
    
    for i in 2...limit {
        if !isPrime[i] { continue }
        for j in stride(from: i*i, through: n-1, by: i) {
            isPrime[j] = false
        }
    }
    var total = 0
    for i in 2..<n {
        if isPrime[i] {
            total += 1
        }
    }
    return total
}

countPrimes(3)

//: [Next](@next)
