//: [Previous](@previous)

/**
 # Revenue Milestones
 
 We keep track of the revenue Facebook makes every day, and we want to know on what days Facebook hits certain revenue milestones. Given an array of the revenue on each day, and an array of milestones Facebook wants to reach, return an array containing the days on which Facebook reached every milestone.
 
 Signature
 int[] getMilestoneDays(int[] revenues, int[] milestones)
 
 Input
 revenues is a length-N array representing how much revenue FB made on each day (from day 1 to day N). milestones is a length-K array of total revenue milestones.
 
 Output
 Return a length-K array where K_i is the day on which FB first had milestones[i] total revenue. If the milestone is never met, return -1.
 
 Example
 revenues = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
 milestones = [100, 200, 500]
 output = [4, 6, 10]
 
 Explanation
 On days 4, 5, and 6, FB has total revenue of $100, $150, and $210 respectively. Day 6 is the first time that FB has >= $200 of total revenue.
 
 */

import Foundation

func getMilestoneDays(_ revenues: [Int], _ milestones: [Int]) -> [Int] {
    if revenues.isEmpty || milestones.isEmpty {
        return []
    }
    
    var milsetonesSorted = milestones
    var sortedResult : [Int: Int] = [:]
    var sumRevenue = 0
    var milestoneAchieved = 0
    
    milsetonesSorted.sort()
    
    for day in 0..<revenues.count {
        sumRevenue += revenues[day]
        for milestone in milsetonesSorted[milestoneAchieved...] {
            if milestone <= sumRevenue {
                sortedResult[milestone] = day+1
                milestoneAchieved += 1
            } else {
                break
            }
        }
    }
    
    var result = [Int]()
    for milestone in milestones {
        result.append(sortedResult[milestone]!)
    }
    
    return result
}

// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

var test_case_number = 1
func check(_ expected: [Int], _ output: [Int]) {
    var result = true
    if expected.count != output.count {
        result = false
    }
    for i in 0..<min(expected.count, output.count) {
        result = result && (expected[i] == output[i])
    }
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    if result {
        print("\(rightTick) Test #\(test_case_number)")
    } else {
        print("\(wrongTick) Test # \(test_case_number): Expected \(expected) Your output: \(output)")
    }
    test_case_number += 1
}

let revenues_1 = [100, 200, 300, 400, 500]
let milestones_1 = [300, 800, 1000, 1400]
let expected_1 = [2, 4, 4, 5]
let output_1 = getMilestoneDays(revenues_1, milestones_1)
check(expected_1, output_1)

let revenues_2 = [700, 800, 600, 400, 600, 700]
let milestones_2 = [3100, 2200, 800, 2100, 1000]
let expected_2 = [5, 4, 2, 3, 2]
let output_2 = getMilestoneDays(revenues_2, milestones_2)
check(expected_2, output_2)

let revenues_3 = [Int]()
let milestones_3 = [Int]()
let expected_3 = [Int]()
let output_3 = getMilestoneDays(revenues_3, milestones_3)
check(expected_3, output_3)

//: [Next](@next)
