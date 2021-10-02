//: [Previous](@previous)

import Foundation

func firstBadVersion(_ n: Int) -> Int {
    return lookUpBadVersion(0, high: n)
}

func lookUpBadVersion(_ low: Int, high: Int) -> Int {
    if high-low == 1 { return isBadVersion(low) ? low : high }
    
    let medium = (high-low)/2
    if isBadVersion(low+medium) {
        //Look up in the inferior side
        print("Inferior Low:\(low), High:\(high), Medium:\(medium)")
        return lookUpBadVersion(low, high: (high-medium))
    } else {
        //Look up in the superior side
        print("Superior Low:\(low), High:\(high), Medium:\(medium)")
        return lookUpBadVersion((low+medium), high: high)
    }
}

func isBadVersion(_ n: Int) -> Bool {
    if n >= 3 { return true }
    return false
}

firstBadVersion(6)

//: [Next](@next)
