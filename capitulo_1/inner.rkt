#lang racket

(define (square x)
  (* x x))

(define (average x y) 
  (/ (+ x y) 2))

; outer procedure
(define (sqrt x)

  ; inner procedures
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

  ; call
  (sqrt-iter 1.0 x))

(sqrt 2)
