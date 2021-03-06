# Week 6 - Lecture 11 - October 10, 2017
## Simplifications of Context-Free Grammars
# Pairwise Disjointness Test (p. 182, 11th ed.)
  - Motivated by finding grammar traits that permit top-down parsing.
  - Can the parser choose the correct Right-Hand Side (RHS) on the basis of the next token of input?
    - Using only the first token generated by the left-most non-terminal in current sentential form.

  - Simple test of a non-left recursive grammar to see if this can be done.
    - Can we compute a set based on the RHS of a given non-terminal symbol in a grammar?
      - These sets called first are defined as:
        - `FIRST(a) = {a|α => *aB} (if a => *∈, ∈ is in FIRST(α))`
        - * means 0 or more derivation steps
        - Usually done by inspection

      > In other words: If non-terminal A has more than one RHS, the first *terminal* symbol that can be generated in a derivation for each of them must be unique to that RHS.

      - Example:

        A -> aB | bAb | Bb
        B -> cB | d

        - FIRST sets for the RHSs of the A-Rules are:
          - `{a}`, `{b}`, `{c,d}`
          - These sets are clearly disjoint.
          - These rules pass the pairwise disjointness test.

      - Example:

        A -> aB | BAb
        B -> aB | b

        - FIRST sets for A-rules: `{a}`, `{a,b}`
        - FAILED the Pairwise disjointness test
        - From parser: Unable to look one character ahead and know what to do.
        - Fix problem: *left-factoring*
        - Replace w/ following rules:

        <variable> -> identifier<new>
        <new> -> ∈ | [<expression>]

        - *"handle"* -> the specific RHS - that must be rewritten to set the next (previous) sentential form.
        - RHS:
        - RSF: right sentential form
