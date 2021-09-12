//: [Previous](@previous)

import Foundation

func reverse(_ x: Int) -> Int {
    var number = x
    var invertedNumb = 0
    
    while number != 0 {
        invertedNumb = (invertedNumb * 10) + (number%10)
        number /= 10
    }
    
    if invertedNumb > Int32.max || invertedNumb < Int32.min {
        return 0
    }
    
    return invertedNumb
}

reverse(123)

//: [Next](@next)
