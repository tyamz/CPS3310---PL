# Week 4 - Lecture 7 - September 26, 2017
## Logical Pretest Loops
### Denotational Semantics
  - assume 2 existing mappings
  - functions:
    - Ms1 -> map stmt lists¢
          - states to states
    - Mb -> || to Boolean expressions to Boolean values (error)

#### Example:
  - M1(while B do L,s) ∆ =
      if M1(B,s) == undef
        then error
      else if M1(B,s) == false
        then s
      else if Ms1(L,s) == error
        then error
      else M1(while B do L,Ms1(L,s))

-> Essentially the loop has been converted from iteration to recursion. Recursion control is defined by other recursive state mapping functions.

-> Recursion is easier to define w/ mathematical rigor than iteration.

-> Non-termination still very important.

### Evaluation:
  - Objects & Functions -> can also be defined as syntactic entities of a prog. lang

  > Once a complete system is defined, for a given language, we can use that to determine the meaning of programs in the language.

  ∴ -> a framework for thinking about programming in a highly rigorous way

#### Example:
  - If it is hard to describe a stmt in denotational semantics -> programming that stmt will be hard ∴ deconstruct our stmts or augment language.

### Axiomatic Semantics (based on mathematical logic)
  - A relatively abstract approach to semantics
  - Rather than specifying the meaning of a program, axiomatic semantics specify what can be proven about a program.
  - One possible use: to prove correctness of a program.
    - In axiomatic semantics -> we do not worry about "state" of changes as program executes
    - Rather - in axiomatic semantics -
      - meaning of a program is based on relationships between program variables & constraints -> which are the same throughout the program execution.

  - Axiomatic Semantics has 2 applications:
    1. Program verification (P.V.)
    2. Semantics specifications
      - Axiomatic semantics was defined during the development of an approach to prove the correctness of a program
        - "correctness proofs" - show that a program, performs the computation described by the specifications

### Correctness Proofs
  - predicate calculus: (In  the correctness proof, each stmt of a program is preceded & followed by a logical expression that specifies constraints on program variables)
  - The predicates are:
    - preconditions & postconditions
      - each stmt has 1 of each
      precond   postcond for S1   postcond
        ->     S1     ->     S2      ->
                precond for S2

#### Example:
  - assignment stmt:
    sum = 2 * x + 1
      post condition -> sum > 1

  - What is a precond for this?
  {x > 10, x > 50, ... } -> all good preconditions
  weakest precond -> weakest input that will ensure validity of output (meet precondition)
    - 2 * x + 1 > 1
    - 2 * x > 0
    - {x > 0} <- weakest precondition

### Assignment stmts
  - precondition & postcondition of an assignment stmt define its meaning
  - to define the meaning of an assignment stmt there must be a way to compute preconditions
  from postconditions

#### Example:
a = b/2 - 1 {a < 10}
the weakest precond is computed by
- b/2 - 1 < 10
- b/2 < 11
- b < 22 <- weakest precondition

Format: {P} S {Q} -> {precond} stmt {postcond}

#### Example:
{x > 5} x = x - 3 {x > 0}

Is {x > 5} ok?

x - 3 > 0
x > 3 <- weakest precondition

Yes, {x > 5} is okay because it implies {x > 3} => all ok

 - Inference rule -> rule of consequences -> "a postcondition can always be weakened & a precondition can always be strengthened."

#### Example: (sequences)
  - Sequence:
    1. y = 3 * x + 1; {y < 7} (postcondition came from 2.)
      - 3 * x + 1 < 7
      - 3x < 6
      - {x < 2} -> weakest precondition
    2. x = y + 3; {x < 10}
      - y + 3 < 10
      - {y < 7} -> weakest precondition

#### Problems from Book
  23a. a = 2 * (b - 1) - 1 {a > 0}
    - 2 * (b - 1) - 1 > 0
    - 2 * (b - 1) > 1
    - (b - 1) > 1/2
    - {b > 3/2} -> weakest precond
  23b. b = (c + 10) / 3 {b > 6}
    - (c + 10) / 3 > 6
    - (c + 10) > 18
    - {c > 8}
  23c. a = a + 2 * b - 1 {a > 1}
    - a + 2 * b - 1 > 1
    - a + 2 * b > 2
    - 2b > 2 - a
    - b > 1 - a/2
  24a.
      1. a = 2 * b + 1; {a < 3}
        - 2 * b + 1 < 3
        - 2 * b < 2
        - b < 1
      2. b = a - 3; {b < 0}
        - a - 3 < 0
        - {a < 3} -> weakest precond
  24b.
      1. a = 3 * (2 * b + a); {a > 3}
         - 3 * (2 * b + a) > 3
         - 6 * 3b + 3a > 3
         - 2 * b + a > 1
         - 2b > 1 - a
         - b > (1 - a)/2
      2. b = 2 * a - 1; {b > 5}
         - 2 * a - 1 > 5
         - 2 * a > 6
         - {a > 3}
