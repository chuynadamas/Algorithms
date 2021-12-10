//: [Previous](@previous)

import Foundation

func minOverallAwkwardness(arr: [Int]) -> Int {
    // Write your code here
    let sortedArray = arr.sorted()
    var diff = sortedArray[1] - sortedArray[0]
    
    for i in 2..<sortedArray.count {
        let tmp = sortedArray[i] - sortedArray[i-2]
        diff = max(diff, tmp)
    }
    
    return max(diff, sortedArray[sortedArray.count-1]-sortedArray[sortedArray.count-2])
}


minOverallAwkwardness(arr: [5, 10, 6, 8])

//: [Next](@next)
