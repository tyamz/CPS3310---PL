# Week 7 - Lecture 14 - October 19, 2017
## Evaluation of Static Scoping
  - Static scoping is good for non-local access - which works well in many situations
### Problems:
  1. Usually static scoping allows more access to variables and subprograms
  2. Problems related to program evaluation.
    - Software is very dynamic - programs used regularly continually change. Too many globals, etc.
### Evaluation of Dynamic Scoping - p. 228
  - Huge impact on programs
  - When dynamic scoping is used, the correct attributes of non-local variables visible to a program statement cannot be determined statically.
  - References to the name of a variable is not always the same variable
### Problems:
  1. All local variables visible to executes subprograms. Can't protect
