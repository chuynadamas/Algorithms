//: [Previous](@previous)

import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    
    var ocurrences : [Int:Int] = [:]
    var freq: [[Int]] = Array(repeating: [], count: nums.count+1)
    
    for num in nums {
        if let tableValue = ocurrences[num] {
            ocurrences[num] = tableValue + 1
        } else {
            ocurrences[num] = 1
        }
    }

    for (key, value) in ocurrences {
        freq[value].append(key)
    }
    
    var result = [Int]()
    
    for i in (0..<freq.count).reversed() {
        result.append(contentsOf: freq[i])
        if result.count == k {
            return result
        }
    }
    return result
}

topKFrequent([-1,-1],1)

//: [Next](@next)
