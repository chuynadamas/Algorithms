//: [Previous](@previous)

import Foundation

func strobogrammaticNumbers(_ N: Int) -> Int {
    let map : [String : String] = ["0":"0",
                                   "1":"1",
                                   "8":"8",
                                   "6":"9",
                                   "9":"6"]

    var totalStroboNumbers = 0
    
    func isStrobogramaticNumber(_ s: Int) -> Bool {
        let str = Array(String(s))
        for i in 0..<(str.count/2) {
            if let strInverted = map[String(str[str.count-1-i])] {
                if String(str[i]) != strInverted {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
    
    func combos(_ n: Int) {
        var n = n
        
        if n > N {
            return
        }
        
        if isStrobogramaticNumber(n) {
            totalStroboNumbers += 1
        }
        
        n *= 10
        for (_, value) in map {
            combos(n + Int(value)!)
        }
    }
        
    combos(1)
    combos(8)
    combos(6)
    combos(9)

    return totalStroboNumbers
}

//: [Next](@next)
