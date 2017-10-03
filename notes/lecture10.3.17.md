# Week 5 - Lecture 9 - October 3, 2017
## Lexical & Syntactic Analysis
- a low-level part called a lexical analyzer, a finite automaton based on a regular grammar.
- a high-level part caled syntax analyzer, a push-down automaton based on a CFG or BNF.

## Simplicity
- less complex approaches can be used for lexical analysis; separating them simplifies the parser

## Efficiency
- separation allows optimization of the lexical analyzer

## Portability
- parts of the lexical analyzer may not be portable, but the parser will always be portable

## A lexical analyzer
- a pattern matcher for character strings
- a front-end for the parser
- identifies substrings of the source program
- usually a function that is called by the parser when it needs the next token

### Three approaches to building a lexical analyzer
  - Write a formal description of the tokens, construct a table-driven lexical analyzer from such a description
  - Design a state diagram that describes the tokens and write a program that implements the state diagram.
  - Design a state diagram that describes the tokens and hand-construct a table-driven implementation of the state diagram

### State diagram
  - A naïve state diagram would have a transition from every state on every character in the source language - such a diagram would be very large!
![../images/wk5l9fig1.png](test)
