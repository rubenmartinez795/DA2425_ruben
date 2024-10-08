#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

; map
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) 
              null
              sequence))

; append
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

; length
(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

; comprobar
(map (lambda (x) (* x x)) (list 1 2 3 4))
(append (list 1 2 3) (list 4 5 6))
(length (list 1 2 3 4 5))
