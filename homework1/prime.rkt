#lang racket

(define (prime? n)
  (define (prime-iter? i)
    (cond
      [(> (* i i) n) #t]
      [(= (remainder n i) 0) #f]
      [else (prime-iter? (+ i 1))]))
  (if (= n 1)
      #f
      (prime-iter? 2)))
