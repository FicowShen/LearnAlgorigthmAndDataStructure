//
//  DailyProblems.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/1.
//

import Foundation

final class DailyProblems {
    static func run() {
        week3()
        week2()
        week1()
    }

    static func week3() {
        Week3InvertBinaryTree().run()
        Week3GenerateParentheses().run()
        Day21GetKthMagicNumber().run()
        Day18LowestCommonAncestor().run()
        Day17ReversePrint().run()
        Day16ReplaceSpace().run()
    }

    static func week2() {
        Week2GroupAnagrams().run()
        Week2ValidAnagram().run()
        Week2BinaryTreeInorderTraversal().run()
        Week2BinaryTreePreorderTraversal().run()
        Week2NaryTreePostorderTraversal().run()
        Week2NaryTreePreorderTraversal().run()
        Week2NaryTreeLevelOrderTraversal().run()
        Week2GetLeastNumbers().run()
        Day13MaximumDepthOfBinaryTree().run()
        Day12AddDigits().run()
        Day11FizzBuzz().run()
        Day10RemoveOutermostParentheses().run()
        Day9SlidingWindowMaximum().run()
        Day8IntersectionOfTwoArraysII().run()
    }

    static func week1() {
        Week1ReverseNodesInKGroup().run()
        Week1ThreeSum().run()
        Week1MergeSortedArray().run()
        Week1ValidParentheses().run()
        Week1LinkedListCycleII().run()
        Week1LinkedListCycle().run()
        Week1ReverseLinkedList().run()
        Week1ContainerWithMostWater().run()
        Day7DesignCircularDeque().run()
        Day6MoveZeroes().run()
        Day5MergeTwoSortedLists().run()
        Day4SwapNodesInPairs().run()
        Day3TwoSum().run()
        Day2PlusOne().run()
        Day1ClimbStairs().run()
        TheKWeakestRowsInAMatrix().run()
    }
}
