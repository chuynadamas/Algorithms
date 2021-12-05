//: [Previous](@previous)
/*
 Given a non-negative integer x, compute and return the square root of x.

 Since the return type is an integer, the decimal digits are truncated, and only the integer part of the result is returned.

 Note: You are not allowed to use any built-in exponent function or operator, such as pow(x, 0.5) or x ** 0.5.

  
 ```
 Example 1:

 Input: x = 4
 Output: 2
 ```
 */
import Foundation

func mySqrt(_ x: Int) -> Int {
    var i = 0
    while i*i <= x {
        i += 1
    }
    
    return i-1
}

//: [Next](@next)
