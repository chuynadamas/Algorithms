//: [Previous](@previous)
/*
 
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

  
```
 Example 1:

 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 ```
 
 */

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
            //There is no merge we should create a new interval in results
            results.append(intervals[intervalIndex])
        }
    }
    
    return results
}

//: [Next](@next)
