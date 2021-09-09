//
//  Week2 GroupAnagrams.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/14.
//

import Foundation

// https://leetcode-cn.com/problems/group-anagrams/
final class Week2GroupAnagrams {
    func run() {
        let f = groupAnagramsWithLetterCountKey4
        func judge(values: [String], expected: [[String]]) {
            let result = f(values)
            printAndAssert(result: result.count, expected: expected.count)
            let numberOfElements: ([String], [String]) -> Bool = {
                if $0.count == $1.count {
                    return ($0.first ?? "") < ($1.first ?? "")
                }
                return $0.count < $1.count
            }
            let zipped = zip(result.sorted(by: numberOfElements),
                             expected.sorted(by: numberOfElements))
            for pair in zipped {
                printAndAssert(result: Set(pair.0), expected: Set(pair.1))
            }
        }
        judge(values: ["eat","tea","tan","ate","nat","bat"],
              expected: [["bat"],["nat","tan"],["ate","eat","tea"]])
        judge(values: [""], expected: [[""]])
        judge(values: ["a"], expected: [["a"]])
        judge(values: ["ac","c"], expected: [["c"],["ac"]])
        judge(values: ["cab","tin","pew","duh","may","ill","buy","bar","max","doc"],
              expected: [["max"],["buy"],["doc"],["may"],["ill"],["duh"],["tin"],["bar"],["pew"],["cab"]])
    }



    func groupAnagramsWithLetterCountKey6(_ strs: [String]) -> [[String]] {
        fatalError()
    }

    func groupAnagramsWithDictAndSort6(_ strs: [String]) -> [[String]] {
        fatalError()
    }



    func groupAnagramsWithLetterCountKey5(_ strs: [String]) -> [[String]] {
        fatalError()
    }

    func groupAnagramsWithDictAndSort5(_ strs: [String]) -> [[String]] {
        fatalError()
    }









    func groupAnagramsWithLetterCountKey4(_ strs: [String]) -> [[String]] {
        let letters = (0..<26).map { Character(UnicodeScalar(97 + $0)) }
        var dict = [String: [String]]()
        for s in strs {
            let chars = Array(s)
            var counter = [Character: Int]()
            for c in chars {
                counter[c, default: 0] += 1
            }
            var key = ""
            for letter in letters {
                guard let count = counter[letter] else { continue }
                key.append(letter)
                key.append(count.description)
            }
            dict[key, default: [String]()].append(s)
        }
        return [[String]](dict.values)
    }

    func groupAnagramsWithDictAndSort4(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for s in strs {
            let key = String(s.sorted())
            dict[key, default: [String]()].append(s)
        }
        return [[String]](dict.values)
    }






    func groupAnagramsWithLetterCountKey3(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for s in strs {
            var times = [Int](repeating: 0, count: 26)
            for c in s {
                let i = Int(c.asciiValue! - 97)
                times[i] += 1
            }
            var key = ""
            for i in 0..<times.count {
                key.append(Character(Unicode.Scalar(i + 97)!))
                key.append(times[i].description)
            }
            dict[key, default: []].append(s)
        }
        return [[String]](dict.values)
    }

    func groupAnagramsWithDictAndSort3(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for s in strs {
            let key = String(s.sorted())
            dict[key, default: []].append(s)
        }
        return [[String]](dict.values)
    }


















    func groupAnagramsWithLetterCountKey2(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for s in strs {
            var letters = [Int](repeating: 0, count: 26)
            for c in s { letters[Int(c.asciiValue! - 97)] += 1 }
            let key = (0..<letters.count).reduce(into: "") { key, i in
                if letters[i] > 0 {
                    key.append(Character(Unicode.Scalar(i + 97)!))
                    key.append(letters[i].description)
                }
            }
            dict[key, default: []].append(s)
        }
        return [[String]](dict.values)
    }

    func groupAnagramsWithDictAndSort2(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for s in strs {
            dict[String(s.sorted()), default: []].append(s)
        }
        return [[String]](dict.values)
    }





    // Time: O(n(k+m)), Space: O(n(k+m))
    func groupAnagramsWithLetterCountKey1(_ strs: [String]) -> [[String]] {
        let a = 97
        let chars = (0..<26).map { String.Element(Unicode.Scalar($0 + a)!) }
        var dict = [String: [String]]()
        for s in strs { // O(n)
            var array = [Int16](repeating: 0, count: 26)
            for c in s { // O(k)
                let i = Int(c.asciiValue! - 97)
                array[i] += 1
            }
            var key = ""
            for i in 0..<26 { // O(m)
                key.append(chars[i])
                key += array[i].description
            }
            dict[key, default: []].append(s)
        }
        return [[String]](dict.values)
    }

    // Time: O(nklogk), Space: O(nk)
    func groupAnagramsWithDictAndSort1(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for s in strs {
            let key = String(s.sorted()) // O(klogk), k is the max length
            dict[key, default: []].append(s)
        }
        return [[String]](dict.values)
    }
}
