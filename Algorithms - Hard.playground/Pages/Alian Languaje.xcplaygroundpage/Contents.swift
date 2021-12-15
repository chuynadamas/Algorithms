//: [Previous](@previous)

/**
 Given a sorted dictionary (array of words) of an alien language, find order of characters in the language.
 
 Input:  words[] = {"baa", "abcd", "abca", "cab", "cad"}
 Output: Order of characters is 'b', 'd', 'a', 'c'
 Note that words are sorted and in the given language "baa"
 comes before "abcd", therefore 'b' is before 'a' in output.
 Similarly we can find other orders.

 Input:  words[] = {"caa", "aaa", "aab"}
 
 Output: Order of characters is 'c', 'a', 'b'
 */


import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

func alienOrder(_ words: [String]) -> String {
    var adj: [Character : Set<Character>] = [:]
    for w in words { for c in w { adj[c] = [] } }
    
    for i in 0..<words.count-1 {
        let w1 = words[i]
        let w2 = words[i+1]
        let minLen = min(w1.count, w2.count)
        if w1.count > w2.count && w1.prefix(minLen) == w2.prefix(minLen) {
            return  ""
        }
        
        for j in 0..<minLen {
            if w1[j] != w2[j] {
                adj[w1[j]]!.insert(w2[j])
                break
            }
        }
    }
    
    var visit: [Character: Bool] = [:]
    var result: [Character] = []
    
    
    @discardableResult func dfs(_ c: Character) -> Bool {
        if visit[c] != nil {
            return visit[c]!
        }
        visit[c] = true
        adj[c]!.forEach({ next in
            dfs(next)
        })
        visit[c] = false
        result.append(c)
        return false
    }
    
    for (key, _) in adj {
        if dfs(key) {
            return ""
        }
    }
    
    result = result.reversed()
    return String(result)
}

alienOrder(["caa", "aaa", "aab"])

//: [Next](@next)
