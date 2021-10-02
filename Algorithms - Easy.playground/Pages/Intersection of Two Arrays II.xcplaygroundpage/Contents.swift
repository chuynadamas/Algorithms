//: [Previous](@previous)

import Foundation

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var table : [Int : Int] = [:]
    var duplicates: [Int] = []
    
    for num in nums1 {
        if let ocurrences = table[num] {
            table[num] = ocurrences + 1
        } else {
            table[num] = 1
        }
    }
    
    for num in nums2 {
        if  let ocurrences = table[num],
            ocurrences > 0 {
            table[num] = ocurrences - 1
            duplicates.append(num)
        }
    }
    
    return duplicates
}


intersect([1,2,2,1],[2,2])
//: [Next](@next)
