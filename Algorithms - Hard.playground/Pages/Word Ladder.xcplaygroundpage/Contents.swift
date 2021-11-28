//: [Previous](@previous)

import Foundation
import Darwin

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    guard wordList.firstIndex(of: endWord) != nil else {
        return 0
    }
    
    var wordList = wordList
    var collections: [String : [String]] = [:]
    
    wordList.append(beginWord)
    
    for word in wordList {
        for j in 0..<word.count {
            var currentPatter = Array(word)
            currentPatter[j] = "*"
            let patternWord = String(currentPatter)
            
            if collections[patternWord] == nil {
                collections[patternWord] = [word]
            } else {
                collections[patternWord]!.append(word)
            }
        }
    }
    
    var visit: Set<String> = [beginWord]
    var queue: [String] = [beginWord]
    var result = 1
    
    while !queue.isEmpty {
        for i in 0..<queue.count {
            var word = queue.removeFirst()
            if word == endWord {
                return result
            }
            
            for j in 0..<word.count {
                var currentPatternWord = Array(word)
                currentPatternWord[j] = "*"
                let actualWord = String(currentPatternWord)
                
                for newWord in collections[actualWord]! {
                    if !visit.contains(newWord) {
                        visit.insert(newWord)
                        queue.append(newWord)
                    }
                }
            }
        }
        result += 1
    }
    
    return 0
}

ladderLength("hot","dog",["hot","dog"])

//: [Next](@next)
