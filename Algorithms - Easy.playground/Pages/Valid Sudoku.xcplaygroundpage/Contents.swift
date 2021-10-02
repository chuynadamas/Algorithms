//: [Previous](@previous)

import Foundation

var maskSquares : [Point] = [
    Point(row:-1, column:-1),
    Point(row:-1, column:0),
    Point(row:-1, column:1),
    Point(row:0, column:-1),
    Point(row:0, column:0),
    Point(row:0, column:1),
    Point(row:1, column:-1),
    Point(row:1, column:0),
    Point(row:1, column:1),
]

var centers : [Point] = [
    Point(row: 1, column:1),
    Point(row: 1, column:4),
    Point(row: 1, column:7),
    Point(row: 4, column:1),
    Point(row: 4, column:4),
    Point(row: 4, column:7),
    Point(row: 7, column:1),
    Point(row: 7, column:4),
    Point(row: 7, column:7),
]


func isValidSudoku(_ board: [[Character]]) -> Bool {
    return isValidInRows(board) && isValidInColumns(board) && isValidInCenters(board)
}


func isValidInRows(_ board:[[Character]]) -> Bool {
    for row in board {
        var table : [Character: Bool] = [:]
        for character in row {
            if  character != "." {
                if  table[character] == nil {
                    table[character] = true
                } else {
                    return false
                }
            }
        }
    }
    return true
}

func isValidInColumns(_ board:[[Character]]) -> Bool {
    for column in board.indices {
        var table : [Character : Bool] = [:]
        for row in board[column].indices {
            if board[row][column] != "." {
                if table[board[row][column]] == nil {
                    table[board[row][column]] = true
                } else {
                    return false
                }
            }
        }
    }
    return true
}

func isValidInCenters(_ board:[[Character]]) -> Bool {
    for center in centers {
        var table : [Character : Bool] = [:]
        for mask in maskSquares {
            let character = board[center.row + mask.row][center.column + mask.column]
            if character != "." {
                if table[character] == nil {
                    table[character] = true
                } else {
                    return false
                }
            }
        }
    }
    return true
}

struct Point {
    var row : Int
    var column : Int
}

let test : [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]


isValidSudoku(test)
//: [Next](@next)
