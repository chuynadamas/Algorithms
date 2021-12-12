//: [Previous](@previous)
/**
 Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],…] (si < ei), find the minimum number of conference rooms required.
 
 For example, Given [[0, 30],[5, 10],[15, 20]], return 2.
 */

import Foundation

struct Interval {
    let start: Int
    let end: Int
    
}

func meetingRooms(meetings: [Interval]) -> Int {
    guard meetings.count > 0 else {
        return 0
    }
    
    var intervals = meetings
    intervals = intervals.sorted { $0.start < $1.start }
    
    var rooms: [Interval] = []
    
    for interval in intervals {
        var found = false
        for roomIndex in 0..<rooms.count {
            if interval.start >= rooms[roomIndex].end {
                rooms[roomIndex] = Interval(start:rooms[roomIndex].start, end:interval.end)
                found = true
                break
            }
        }
        if found == false {
            rooms.append(interval)
        }
    }
    
    return rooms.count
}

meetingRooms(meetings:[Interval(start:0,end:30),
                       Interval(start:15,end:20),
                       Interval(start:5,end:10)])

//: [Next](@next)
