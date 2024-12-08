#lang racket
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op 
                      initial 
                      (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; reverse usando fold-right
(define (reverse-right sequence)
  (fold-right 
   (lambda (x y) (append y (list x))) null sequence))

; reverse usando fold-left
(define (reverse-left sequence)
  (fold-left 
   (lambda (x y) (append (list y) x)) null sequence))

; comprobar
(reverse-right (list 1 4 9 16 25))
(reverse-left (list 1 4 9 16 25))