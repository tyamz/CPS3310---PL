# Week 4 - Lecture 8 - September 28, 2017
## Racket Examples

    1.5 * (2 - 1/4) + -5.7
    (+ (* 1.5 (- 2 (/ 1 4))) -5.7)

    1 + 5 * 8 + 6
    (+ (+ 1 (* 5 8)) 6)

    (+ 76 31) => 107
    (* -12 10) => -120
    '(a b c d) => (a b c d)

`cons -> construct`
`car -> contents of address register`

`[address] [contents register]`
`car         cdr`

`(car '(a b c)) => a`

`(cdr '(a b c)) => '(b c)`

`(cons 'a' '(b c)) => '(a quote (b c))`

    (cons (car '(a b c))
      (cdr '(d e f))) => '(a e f)

## a procedure:

    (define square
      (lambda (n)
      (* n n))) => n^2

## factorial f! => n * (n - 1)...

    (define (factorial n)
      (if (= n 1)
        1
        (* n (factorial (- n 1)))))


## Racket
- Racket file -> set of definitions
  - Can order our functions however we want.
  - Cannot have two binding values use the same variable
  - Bindings are mutable: set! exists
  - x in our environment then (set! x 13) -> now working with x mapped to 13

## ;; Building lists
- empty ; => '()

`(list 1  2 3) ; => '(1 2 3)`

`(cons 0 (list 1 2 3)) ; => (0 1 2 3)`

`(cons 1 empty) ; => '(1)`

`(cons 'a (cons 2 empty)) ; => '(a 2)`

`(append (list 1 2) list(3 4)) => '(1 2 3 4)`

`(first (list 1 2 3)) => '1`

`(rest (list 1 2 3)) -> '2 3`

## Racket & Typing
- "untyped" - Racket
- type annotations & type inference which reduce the amount of declarations used.

- Statically typed language -> Java, C
- Dynamically typed language -> JavaScript (Hybrid), Ruby

- Why (static) types?
  - Types help structure our programs.
  - provide enforced & mandatory documentation
  - help catch erros

- Why Racket w/ types?
  - Data-first design -> the structure of our program is determined by the structure of our data derived.
  - A language for describing data, we can be more precise in our code.

## Example:
- Write a function in Racket to sum up the elements of a list...
  - Write a function called `sumlist` which is passed a list of numbers & returns the sum.

    (define sumlist
      (lambda (lst)
        (if (empty? lst)
          (+ (car lst) (sumlist (cdr lst))))))

## Example:
- Write a function `make-seq-list` which accepts 2 parameters (x y) & returns a list containing (x, x + 1, x + 2, y)
- Assume: x, y are integers & (x < y)

    (define (make-seq-list x y)
      (if (>= x y)
          (if (= x y) (cons y empty) #f)(cons x (make-seq-list (+ x 1) y))))


## Example:
- Write a function `make-whole-list` which accepts one parameters `x` & returns a list (1, 2, 3, ..., x)
- Assume: x is an integer & (x > 1)

    (define (make-whole-list x) (make-seq-list 1 x))
