//: [Previous](@previous)

import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    for index in (0..<digits.count).reversed() {
        if  digits[index] < 9 {
            digits[index] += 1
            break
        } else {
            digits[index] = 0
        }
    }
    
    if digits[0] == 0 {
        digits.insert(1, at: 0)
    }
    return digits
}

plusOne([1,2,3])


//: [Next](@next)
