//: [Previous](@previous)

/*
 Implement a SnapshotArray that supports the following interface:

 SnapshotArray(int length) initializes an array-like data structure with the given length.  Initially, each element equals 0.
 void set(index, val) sets the element at the given index to be equal to val.
 int snap() takes a snapshot of the array and returns the snap_id: the total number of times we called snap() minus 1.
 int get(index, snap_id) returns the value at the given index, at the time we took the snapshot with the given snap_id
  

 Example 1:

 Input: ["SnapshotArray","set","snap","set","get"]
 [[3],[0,5],[],[0,6],[0,0]]
 Output: [null,null,0,null,5]
 Explanation:
 SnapshotArray snapshotArr = new SnapshotArray(3); // set the length to be 3
 snapshotArr.set(0,5);  // Set array[0] = 5
 snapshotArr.snap();  // Take a snapshot, return snap_id = 0
 snapshotArr.set(0,6);
 snapshotArr.get(0,0);  // Get the value of array[0] with snap_id = 0, return 5
 
 */

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


