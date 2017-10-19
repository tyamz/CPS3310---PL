## Midterm Review - October 19, 2017
## Syntax & Semantics
- Lexical Analysis
  - Pattern matching
  - (**_Scanner:_** seeking to find substrings of characters that match specified patterns)
  - Front-end of syntax analysis (tokens, lexemes, )
- Parsing
  - analyzing syntax (a.k.a. syntax analysis)
  - General:
    - Parsing problem
    - 2 categories of algorithms
      1. Top Down
      2. Bottom Up
    - (also complexity)
## Theory of Computing
- What are the fundamental capabilities & limitations of computers?
  - Automaton
    - Mathematical models of computation (part of applied computer science)
    1. Finite Automaton - text processing compilers, hardware design
    2. Context-Free Grammars (CFG & BNF) - used in PL & AI, formal definitions
  - Computability
    - Classification of problems as those that are solvable & those therefore not
      - Godel
      - Turing
      - Church
  - Complexity
    - Why are some problems hard and others easy?
      - We classify problems according to their complexity.

- A context-free grammar (CFG) is a generator for a context-free language (CFL)
  - Parsers for PLs construct parse trees for programs
    - Parse trees & Derivations
      - Give all the syntactic information needed by a language processor
    - LR & LL
      - Classes of grammars where parsers run in linear time
## Parsers

| Parse Class | How it Works                                                                                                                                                                                 | What It Means                                                                                                      | Example Alg.                                                                                     |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------ |
| Top Down    | Tree is built from the root downward towards the leaves. Prohibitions to recursive descent parsing: 1. left-recursion (eliminated) 2. pairwise disjointness test (first set, left-factoring) | Builds tree in *PREORDER* w/ left-most derivation. Usually choosing best RHS by "lookahead" to next token symbol.  | Recursive descent parser *simple LL* alg. Left-to-right left-most derivation                     |
| Bottom Up   | Parse tree built from leaves up to root.                                                                                                                                                     | Construct the reverse of a right most derivation & parse tree in bottom up, read a substring and start => HANDLE.  | Left-to-right right most derivation LR family (shift reduce parsers) handle and sentential form. |

- Parsers that work for all unambiguous CFG have O(n^3) complexity (n === the length of the input program)
- Parser that implement syntax analyzers for PLs work on subclasses of unambiguous grammars:
  - O(n)
