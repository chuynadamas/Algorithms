//: [Previous](@previous)
/*
 Given two integers a and b, return the sum of the two integers without using the operators + and -.

  

 Example 1:

 Input: a = 1, b = 2
 Output: 3
 
 */

import Foundation

func getSum(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    var tmp = 0
    
    while b != 0 {
        tmp = (a & b) << 1
        a = a ^ b
        b = tmp
    }
    return a
}


getSum(-3,5)
//: [Next](@next)
