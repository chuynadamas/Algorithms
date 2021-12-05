//: [Previous](@previous)
/*
 Given an integer n, return the number of trailing zeroes in n!.

 Note that n! = n * (n - 1) * (n - 2) * ... * 3 * 2 * 1.
 
 ```
 Example 1:

 Input: n = 3
 Output: 0
 Explanation: 3! = 6, no trailing zero.
 ```
 
 ```
 Example 2:

 Input: n = 5
 Output: 1
 Explanation: 5! = 120, one trailing zero.
 ```
 
 */

import Foundation

func trailingZeroes(_ n: Int) -> Int {
    var factorOfFive = 0
    var tmp = n
    while tmp >= 5 {
        tmp /= 5
        factorOfFive += 1
    }
    
    if factorOfFive < 1 {
        return 0
    }
    
    var result = 0
    for index in 1...factorOfFive {
        let base = NSDecimalNumber(decimal: pow(5,index)).intValue
        result += n/base
    }
    return result
}

trailingZeroes(5)

//: [Next](@next)
