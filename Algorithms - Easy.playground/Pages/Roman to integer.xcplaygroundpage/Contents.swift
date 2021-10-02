//: [Previous](@previous)

import Foundation

let table : [Character : Int] = [
   "I" : 1,
   "V" : 5,
   "X" : 10,
   "L" : 50,
   "C" : 100,
   "D" : 500,
   "M" : 1000
]

func romanToInt(_ s: String) -> Int {
    var numbers : [Int] = []
    for char in s { numbers.append(table[char]!) }
    
    for i in 1..<numbers.count {
        if numbers[i-1] < numbers[i] {
            numbers[i-1] = -numbers[i-1]
        }
    }
    return numbers.reduce(0) { $0 + $1 }
}

romanToInt("M")


//: [Next](@next)
