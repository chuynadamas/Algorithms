//: [Previous](@previous)
/*
 Given an m x n grid of characters board and a string word, return true if word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.
 
 
 ```
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 Output: true
 ```
 */

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    
    func backtracking(_ board: [[Character]],
                      _ row: Int,
                      _ column: Int,
                      _ index: Int,
                      _ word: [Character]) -> Bool {
        if index == word.count {
            return true
        }
        
        if  row < 0 ||
            row >= board.count ||
            column < 0 ||
            column >= board[row].count ||
            board[row][column] != word[index] {
                return false
        }
        
        var board = board
        _ = board[row][column]
        board[row][column] = " "
        
        let found = backtracking(board, row+1, column, index+1, word) ||
                    backtracking(board, row-1, column, index+1, word) ||
                    backtracking(board, row, column+1, index+1, word) ||
                    backtracking(board, row, column-1, index+1, word)
        
        return found
    }
    
    let arrayWord = Array(word)
    for row in 0..<board.count {
        for column in 0..<board[row].count {
            if board[row][column] == arrayWord[0] && backtracking(board, row, column, 0, arrayWord) {
                return true
            }
        }
    }
    
    return false
}

exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]],"ABCCED")

//: [Next](@next)
