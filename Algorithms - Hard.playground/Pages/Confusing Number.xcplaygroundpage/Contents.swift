//: [Previous](@previous)

import Foundation

func confusingNumbers(_ N: Int) -> Int {
    let map = ["0":"0",
               "1":"1",
               "6":"9",
               "8":"8",
               "9":"6"]
    
    var totalConfusingNumberCount = 0
    
    func isConfusingNumber(_ s: Int) -> Bool {
        var str = Array(String(s))
        
        for character in str {
            if map[String(character)] == nil {
                return false
            }
        }
        
        var result = ""
        for character in str.reversed() {
            result += map[String(character)]!
        }
        
        if result != String(str) {
            return true
        }
        return false
    }
    
    
    func combos(_ n: Int) {
        var n = n
        
        if n > N {
            return
        }
            
        if isConfusingNumber(n) {
            totalConfusingNumberCount += 1
        }
        
        n *= 10
        for (key, value) in map {
            combos(n + Int(value)!)
        }
    }
    
    combos(1)
    combos(6)
    combos(8)
    combos(9)
    
    return totalConfusingNumberCount
}


confusingNumbers(20)

//: [Next](@next)
