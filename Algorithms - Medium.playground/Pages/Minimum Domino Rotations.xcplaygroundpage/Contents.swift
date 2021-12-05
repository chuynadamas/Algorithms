//: [Previous](@previous)
/*
 In a row of dominoes, tops[i] and bottoms[i] represent the top and bottom halves of the ith domino. (A domino is a tile with two numbers from 1 to 6 - one on each half of the tile.)

 We may rotate the ith domino, so that tops[i] and bottoms[i] swap values.

 Return the minimum number of rotations so that all the values in tops are the same, or all the values in bottoms are the same.

 If it cannot be done, return -1.

  

 Example 1:


 Input: tops = [2,1,2,4,2,2], bottoms = [5,2,6,2,3,2]
 Output: 2
 Explanation:
 The first figure represents the dominoes as given by tops and bottoms: before we do any rotations.
 If we rotate the second and fourth dominoes, we can make every value in the top row equal to 2, as indicated by the second figure.
 
 */

import Foundation

func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
    let AB = dominoRotations(tops, bottoms)
    let BA = dominoRotations(bottoms,tops)
    
    return AB == -1 ? BA : BA == -1 ? AB : min(AB, BA)
}

func dominoRotations(_ A: [Int], _ B: [Int]) -> Int {
    var minRotation = Int.max
    
    for side in 1...6 {
        var swap = 0
        var index = 0
        for i in 0..<A.count {
            index += 1
            if A[i] == side {
                continue
            } else if B[i] == side {
                swap += 1
            } else {
                break
            }
        }
        if index == A.count && minRotation > swap {
            minRotation = swap
        }
    }
    return minRotation == Int.max ? -1 : minRotation
}

minDominoRotations([2,1,2,4,2,2],[5,2,6,2,3,2])

//: [Next](@next)
