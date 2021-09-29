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
    var total : Int = 0
    for char in s.reversed() {
        numbers.append(table[char]!)
    }
    
    for i in stride(from: 1, through: numbers.count-1, by: 2) {
        if numbers[i-1] > numbers[i] {
            total = numbers[i-1] - numbers[i]
        }
    }
    
    print(numbers)
    return total
}

romanToInt("MCMXCIV")


//: [Next](@next)
