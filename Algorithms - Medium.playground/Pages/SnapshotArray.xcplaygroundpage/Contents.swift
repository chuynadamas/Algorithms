//: [Previous](@previous)

import Foundation

//: [Next](@next)

class SnapshotArray {
    private var dict = [Int: Int]()
    private var snapshot = [Int: [Int: Int]]()
    private var length: Int = 0
    
    var snapTimes = 0

    init(_ length: Int) {
        self.length = length
    }
    
    func set(_ index: Int, _ val: Int) {
        self.dict[index] = val
    }
    
    func snap() -> Int {
        self.snapshot[snapTimes] = self.dict
        snapTimes += 1
        return snapTimes-1
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        return self.snapshot[snap_id]?[index] ?? 0
    }
}


