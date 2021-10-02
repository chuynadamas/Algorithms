//: [Previous](@previous)

import Foundation

func countPrimes(_ n: Int) -> Int {
    if n <= 2 { return 0 }
    var primes = Array(repeating: true, count: n)
    var i = 2
    
    while i * i < n {
        if primes[i] {
            var j  = i
            while j * i < n {
                primes[j * i] = false
                j += 1
            }
        }
        i += 1
    }
    
    var count = 0
    for k in stride(from: 2, to: n, by: 1) {
        count += primes[k] ? 1 : 0
    }
    
    return count
}

countPrimes(3)

//: [Next](@next)
