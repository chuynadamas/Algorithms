//: [Previous](@previous)

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
