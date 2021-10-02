//: [Previous](@previous)

import Foundation

func rob(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    if nums.count == 1 { return nums[0] }
    if nums.count == 2 { max(nums[0], nums[1]) }

    var dp : [Int] = [nums[0], max(nums[1], nums[0])]
    
    for i in 2..<nums.count {
        dp.append(max(nums[i] + dp[i-2], dp[i-1]))
    }
    print(dp)
    
    return dp[nums.count-1]
}


//rob([2,7,9,3,1])
//rob([2])
//rob([])
//rob([1,2,3,1])
rob([2,1,1,2])

//: [Next](@next)
