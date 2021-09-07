//
//  DailyProblems.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/1.
//

import Foundation

final class DailyProblems {
    static func run() {
        week5And6()
        week4()
        week3()
        week2()
        week1()
    }

    /// dynamic programming
    static func week5And6() {
        Week6CoinChange().run()
        Week6MinimumPathSum().run()
        Week5JumpGameII().run()
        Day33LongestCommonSubsequence().run()
        Day32MaximumSubarray().run()
    }

    /// depth first search, breadth first search
    /// greedy, binary search
    static func week4() {
        Week4WordLadderII().run()
        Week4FindMinimumInRotatedSortedArray().run()
        Week4SearchA2DMatrix().run()
        Week4JumpGame().run()
        Week4SearchInRotatedSortedArray().run()
        Week4Minesweeper().run()
        Week4WordLadder().run()
        Week4WalkingRobotSimulation().run()
        Week4AssignCookies().run()
        Week4ValidPerfectSquare().run()
        Week4NumberOfIslands().run()
        Week4SqrtX().run()
        Week4FindLargestValueInEachTreeRow().run()
        Week4BestTimeToBuyAndSellStockII().run()
        Week4MinimumGeneticMutation().run()
        Week4BinaryTreeLevelOrderTraversal().run()
        Day28MajorityElement().run()
        Day25LemonadeChange().run()
        Day22Permutations().run()
    }

    /// recursion, tree recursion, divider and conquer, backtrack
    static func week3() {
        Week3Combine().run()
        Week3BuildTree().run()
        Week3BinaryTreeMaxDepth().run()
        Week3ValidateBinarySearchTree().run()
        Week3InvertBinaryTree().run()
        Week3GenerateParentheses().run()
        Day21GetKthMagicNumber().run()
        Day18LowestCommonAncestor().run()
        Day17ReversePrint().run()
        Day16ReplaceSpace().run()
    }


    /// hashmap, mapping, set,
    /// tree, binary tree, binary search tree,
    /// heap, binary heap, graph
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

    /// array, linked list, skip list,
    /// stack, queue, priority queue, deque
    static func week1() {
        Week1LargestRectangleInHistogram().run()
        Week1MinStack().run()
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
