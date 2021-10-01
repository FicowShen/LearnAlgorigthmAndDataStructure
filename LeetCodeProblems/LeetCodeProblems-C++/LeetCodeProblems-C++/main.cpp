//
//  main.cpp
//  LeetCodeProblems-C++
//
//  Created by Ficow on 2021/7/11.
//

#include "Common.h"
#include "TreeProblems.hpp"
#include "BacktrackProblems.hpp"
#include "DynamicProgrammingProblems.hpp"
#include "DailyProblems.hpp"
#include "BinaryIndexedTreeProblems.hpp"

void runProblems() {
    BinaryIndexedTreeProblems().run();
    BacktrackProblems().run();
    DynamicProgrammingProblems().run();
    TreeProblems().run();
}

int main(int argc, const char * argv[]) {
    runProblems();
    return 0;
}
