//: [Previous](@previous)

import Foundation

var prevFizzBuzz : [String] = []

func fizzBuzz(_ n: Int) -> [String] {
    if prevFizzBuzz.count > n {
        return Array(prevFizzBuzz[0..<n].reversed())
    } else {
        var number = n
        while number > 0 {
            if number % 3 == 0 && number % 5 == 0 {
                prevFizzBuzz.append("FizzBuzz")
            } else if number % 3 == 0 {
                prevFizzBuzz.append("Fizz")
            } else if number % 5 == 0 {
                prevFizzBuzz.append("Buzz")
            } else {
                prevFizzBuzz.append(String(number))
            }
            number -= 1
        }
        return prevFizzBuzz.reversed()
    }
}

fizzBuzz(15)

//: [Next](@next)
