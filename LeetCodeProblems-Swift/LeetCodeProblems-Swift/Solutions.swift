//
//  Solutions.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/1/5.
//

import Foundation

final class Solution {

    private func benchmark(_ block: () -> Void) {
        let now = Date()
        block()
        print("Time consumed(ms):", Date().timeIntervalSince(now) * 1000)
    }

    func run() {
//        ArrayProblems().run()
        TreeProblems().run()
    }

}
