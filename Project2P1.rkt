#lang racket

; Thomas Yamakaitis - Project #2 - Racket Code P1
(define (factorial n)
  (cond
    ((< n 0)
      (display "Oops! You can't get a factorial of a negative number."))
    ((= n 0)
     1)
    (else
     (* n (factorial (- n 1))))))