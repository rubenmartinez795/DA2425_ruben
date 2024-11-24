#lang racket
(define (make-accumulator x)
  (define (dispatch y)
    (set! x (+ x y))
    x)
  dispatch)

(define A (make-accumulator 5))
(define B (make-accumulator 7))

; Comprobar
(A 10)
(A 10)
(A 10)
(B 5)
(B 5)
