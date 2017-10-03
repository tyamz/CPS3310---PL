#lang racket

; Thomas Yamakaitis
; Project #1 - CPS 3310 - Programming Languages
; Dr. Morreale

(define sumlist
  (lambda (lst)
    (if (empty? lst)
        0
        (+ (car lst) (sumlist (cdr lst))))))

(define (make-seq-list x y)
  (if (>= x y)
      (if (= x y) (cons y empty) #f)(cons x (make-seq-list (+ x 1) y))))

(define (make-whole-list x) (make-seq-list 1 x))


; Function #3
(define (find-ith-element lst x)
  (if (> x (length lst))
      #f (if (= x 1)
             (car lst) (find-ith-element (cdr lst) (- x 1)))))

; Function #4
(define (last-element lst)
  (if (= (list-length lst) 1)
      (car lst) (last-element (cdr lst))))

; Function #5 
(define (list-length lst)
  (if (empty? lst)
      0
      (+ 1 (list-length (cdr lst)))))

; Function #6
(define rev null)
(define (concat-list lst1 lst2)
  (if (equal? null rev) (set! rev (reverse-list lst1)) null)
  (cond
    ((empty? lst1)
     (let ([ans rev])
         (set! rev '())
         (cons (car ans) lst2)))
    (else
       (set! lst2 (cons (car rev) lst2))
       (set! lst1 (cdr lst1))
       (set! rev (cdr rev))
       (concat-list (cdr rev) lst2))))

; Function #7
(define reversed null)
(define (reverse-list lst)
  (cond
    ((empty? lst)
     (define return reversed)
     (set! reversed null)
     return)
    (else
     (set! reversed (cons (car lst) reversed))
     (reverse-list (cdr lst)))))

; Function(s) #8
(define min null)
(define (min-element lst)
  (if (empty? lst)
      min (cond
            ((null? min)
             (set! min (car lst))
             (min-element (cdr lst)))
            ((> min (car lst))
             (set! min (car lst))
             (min-element (cdr lst)))
            (else
             (min-element (cdr lst))))))

(define max null)
(define (max-element lst)
  (if (empty? lst)
      max (cond
            ((null? max)
             (set! max (car lst))
             (max-element (cdr lst)))
            ((< max (car lst))
             (set! max (car lst))
             (max-element (cdr lst)))
            (else
             (max-element (cdr lst))))))

; Function(s) #9
(define evenLst null)
(define (even lst)
  (if (empty? lst)
      (reverse-list evenLst) (cond
                ((= (modulo (list-length lst) 2) 0)
                 (set! evenLst (cons (car lst) evenLst))
                 (even (cdr lst)))
                (else
                 (even (cdr lst))))))

(define oddLst null)
(define (odd lst)
  (if (empty? lst)
      (reverse-list oddLst) (cond
                ((= (modulo (list-length lst) 2) 0)
                 (odd (cdr lst)))
                (else
                 (set! oddLst (cons (car lst) oddLst))
                 (odd (cdr lst))))))

; Function #10
(define sortedLst '())
(define (merge lst1 lst2)
  (cond
    ((empty? lst1)
     (cond
       ((empty? lst2)
        (define sorted sortedLst)
        (set! sortedLst null)
        sorted)
       (else
        (set! sortedLst (cons (car (reverse-list lst2)) sortedLst))
        (merge lst1 (xcdr lst2)))))
    ((empty? lst2)
     (cond
       ((empty? lst1)
        )
       (else
        (set! sortedLst (cons (car (reverse-list lst1)) sortedLst))
        (merge (xcdr lst1) lst2))))
    ((> (car (reverse-list lst1)) (car (reverse-list lst2)))
     (set! sortedLst (cons (car (reverse-list lst1)) sortedLst))
     (merge (xcdr lst1) lst2))
    (else
     (set! sortedLst (cons (car (reverse-list lst2)) sortedLst))
     (merge lst1 (xcdr lst2)))))

; Function #11
(define (merge-sort lst)
  (cond
    [(or (null? lst) (null? (cdr lst))) lst]
    [(null? (cdr (cdr lst)))
     (merge (list (car lst)) (cdr lst))]
    [#t
     (let ([x (ceiling (/ (list-length lst) 2))])
       (merge (merge-sort (headlist lst x))
                    (merge-sort (taillist lst x))))]))

; Deployed Functions
;; The `xcdr` function removes the last element of a list.
(define (xcdr lst)
  (if (empty? lst)
      lst (reverse-list (cdr (reverse-list lst)))))
; Input : (xcdr (list 1 2 3 4 5 6))
; Output : '(1 2 3 4 5)

;; The `headlist` function returns a sublist of `lst` from index 0 to x.
(define head null)
(define (headlist lst x)
  (cond
    ((= x 0)
     (define return head)
     (set! head null)
     (reverse-list return))
    (else
     (set! head (cons (car lst) head))
     (headlist (cdr lst) (- x 1)))))
; Input : (headlist (list 1 2 3 4 5 6 7) 2)
; Output : '(1 2)

;; The `tailist` function returns a sublist of `lst` from index x to list-length.
(define tail null)
(define (taillist lst x)
  (cond
    ((empty? lst)
     (define return tail)
     (set! tail null)
     (reverse-list return))
    (else
     (cond
       ((> x 0)
        (taillist (cdr lst) (- x 1)))
       (else
        (set! tail (cons (car lst) tail))
        (taillist (cdr lst) x))))))
; Input : (taillist (list 1 2 3 5 6 7) 2)
; Output : '(3 5 6 7)