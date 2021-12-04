//: [Previous](@previous)

import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    
    guard intervals.count > 0 else {
        return []
    }
    
    var intervals = intervals
    intervals = intervals.sorted { $0.first! < $1.first! }
    
    var results: [[Int]] = [intervals[0]]
    
    for intervalIndex in 1..<intervals.count {
        if  results[results.count-1][1] >= intervals[intervalIndex][0] {
                //There is a merge we should merged
                let mergedArray = [
                    min(results[results.count-1][0],intervals[intervalIndex][0]),
                    max(results[results.count-1][1],intervals[intervalIndex][1])]
                results[results.count-1] = mergedArray
        } else {
            //There is no mere we should create a new interval in results
            results.append(intervals[intervalIndex])
        }
    }
    
    return results
}

//: [Next](@next)
