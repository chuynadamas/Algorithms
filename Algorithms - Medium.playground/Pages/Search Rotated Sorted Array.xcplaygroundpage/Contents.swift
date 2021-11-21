//: [Previous](@previous)

import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    var leftIndex = 0
    var rightIndex = nums.count-1
    var middleIndex = 0
    
    while leftIndex <= rightIndex {
        middleIndex = (leftIndex + rightIndex) / 2
        
        if target == nums[middleIndex] {
            return middleIndex
        }
        //sorted portion
        if nums[leftIndex] <= nums[middleIndex] {
            if target > nums[middleIndex] || target < nums[leftIndex] {
                //The number is between the right side
                leftIndex = middleIndex + 1
            } else {
                rightIndex = middleIndex - 1
            }
        } else {
            //rotated portion
            if target < nums[middleIndex] || target > nums[rightIndex]{
                //The number is between the left side
                rightIndex = middleIndex - 1
            } else {
                leftIndex = middleIndex + 1
            }
        }
    }

    return -1
}


search([4,5,6,7,0,1,2], 0)

//: [Next](@next)
