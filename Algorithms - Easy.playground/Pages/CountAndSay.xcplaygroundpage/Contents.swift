//: [Previous](@previous)

import Foundation

var table : [Int : String] = [ 1 : "1"]

func countAndSay(_ n: Int) -> String {
    if n == 1 {
        return table[1]!
    }
    
    var s = table[n-1] != nil ? Array(table[n-1]!) : Array(countAndSay(n-1))
    var count = 1
    var say : String = ""
    var previous_character = s[0]

    for index in 1..<s.count {
        if s[index] == previous_character {
            count += 1
        } else {
            say.append("\(count)\(previous_character)")
            count = 1
            previous_character = s[index]
        }
    }
    
    say.append("\(count)\(previous_character)")
    table[n] = say
    return say
}

countAndSay(7)

//: [Next](@next)
