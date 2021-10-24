//
//  Week6 TaskScheduler.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/24.
//

import Foundation

/*
 https://leetcode-cn.com/problems/task-scheduler/
 1. simulation
 Time: O(m * n), Space: O(n), m: task count, n: task category count(26)

 2. construction
 Time: O(m), Space: O(n), m: task count, n: task category count(26)
 */
final class Week6TaskScheduler {
    func run() {
        let f = construction2
        printAndAssert(result: f(["A","A","A","B","B","B"], 2),
                       expected: 8)
        printAndAssert(result: f(["A","A","A","B","B","B"], 0),
                       expected: 6)
        printAndAssert(result: f(["A","A","A","A","A","A","B","C","D","E","F","G"], 2),
                       expected: 16)
    }








    func construction4(_ tasks: [Character], _ n: Int) -> Int {
        fatalError()
    }

    func simulation4(_ tasks: [Character], _ n: Int) -> Int {
        fatalError()
    }








    func construction3(_ tasks: [Character], _ n: Int) -> Int {
        fatalError()
    }

    func simulation3(_ tasks: [Character], _ n: Int) -> Int {
        fatalError()
    }









    func construction2(_ tasks: [Character], _ n: Int) -> Int {
        var frequency = [Character: Int]()
        for t in tasks { frequency[t, default: 0] += 1 }
        let maxExec = frequency.values.max()!
        let maxTaskCount = frequency.values.reduce(into: 0) {
            $0 += $1 == maxExec ? 1 : 0
        }
        return max((maxExec - 1) * (n + 1) + maxTaskCount, tasks.count)
    }

    func simulation2(_ tasks: [Character], _ n: Int) -> Int {
        var frequency = [Character: Int]()
        for t in tasks { frequency[t, default: 0] += 1 }
        var taskPairs = [(nextValidTime: Int, frequency: Int)]()
        for f in frequency { taskPairs.append((1, f.value)) }
        var time = 0
        for _ in 0..<tasks.count {
            time += 1
            var nextValidTime = Int.max
            for j in 0..<taskPairs.count {
                let task = taskPairs[j]
                if task.frequency == 0 { continue }
                nextValidTime = min(nextValidTime, task.nextValidTime)
            }
            time = max(time, nextValidTime)
            var best = -1
            for j in 0..<taskPairs.count {
                let task = taskPairs[j]
                if task.frequency == 0 || task.nextValidTime > time { continue }
                if best == -1 || task.frequency > taskPairs[best].frequency {
                    best = j
                }
            }
            taskPairs[best] = (time + n + 1, taskPairs[best].frequency - 1)
        }
        return time
    }










    func construction1(_ tasks: [Character], _ n: Int) -> Int {
        var frequency = [Character: Int]()
        for ch in tasks { frequency[ch, default: 0] += 1 }
        let maxExec = frequency.values.max()!
        let maxCount = frequency.values.reduce(into: 0) {
            $0 += ($1 == maxExec ? 1 : 0)
        }
        return max((maxExec - 1) * (n + 1) + maxCount, tasks.count)
    }

    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var frequency = [Character: Int]()
        for ch in tasks { frequency[ch, default: 0] += 1 }
        // sort out tasks
        let taskCount = frequency.count
        var taskPairs = [(nextValid: Int, rest: Int)]()
        for f in frequency { taskPairs.append((1, f.value)) }

        var time = 0
        for _ in 0..<tasks.count {
            time += 1
            var minNextValid = Int.max
            for j in 0..<taskCount {
                if taskPairs[j].rest == 0 { continue }
                minNextValid = min(minNextValid, taskPairs[j].nextValid)
            }
            // skip to next valid time
            time = max(time, minNextValid)
            var best = -1
            for j in 0..<taskCount {
                let task = taskPairs[j]
                // skip invalid cases
                if task.rest == 0 || task.nextValid > time { continue }
                if best == -1 || task.rest > taskPairs[best].rest {
                    best = j
                }
            }
            taskPairs[best] = (time + n + 1, taskPairs[best].rest - 1)
        }
        return time
    }
}
