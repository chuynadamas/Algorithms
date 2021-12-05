//: [Previous](@previous)

/*
 Implement pow(x, n), which calculates x raised to the power n (i.e., xn).

  

 Example 1:

 Input: x = 2.00000, n = 10
 Output: 1024.00000
 */

import Foundation

func myPow(_ x: Double, n: Int) -> Double {
    if n < 0 && x != 0 {
        return myPow(1/x, n: n * -1)
    }
    
    if n == 0 {
        return 1
    }
    
    if n == 1 {
        return x
    }
    
    if n % 2 == 0 {
        let temp = myPow(x, n: n/2)
        return temp * temp
    } else {
        return myPow(x, n: n-1) * x
    }
}

myPow(10, n: 2)

//: [Next](@next)
