//: [Previous](@previous)

import Foundation
import Darwin

struct Robot {
    func clean(){}
    
    func turnLeft(){}
    
    func turnRight(){}
    
    func move() -> Bool { return true }
}

struct Point {
    let x: Int
    let y: Int
}

extension Point: Hashable {
    
}

func cleanRoom(_ robot: Robot) {
    let directions: [Point] = [Point(x:-1,y:0),
                               Point(x:0,y:1),
                               Point(x:1,y:0),
                               Point(x:0,y:-1)]
    var visited: Set<Point> = []
    
    func goBack() {
        robot.turnRight()
        robot.turnRight()
        robot.move()
        robot.turnRight()
        robot.turnRight()
    }
    
    func dfs(_ currentPoint: Point, _ facingDirection: Int) {
        robot.clean()
        visited.insert(currentPoint)
        
        for k in 0..<directions.count {
            let newDirectionIndex = (facingDirection + k) % 4
            let nextDirection = directions[newDirectionIndex]
            let newPoint = Point(x: currentPoint.x + nextDirection.x,
                                 y: currentPoint.y + nextDirection.y)
            
            if !visited.contains(newPoint) && robot.move() {
                dfs(newPoint, newDirectionIndex)
                goBack()
            }
            robot.turnRight()
        }
    }
}

cleanRoom(Robot())

//: [Next](@next)
