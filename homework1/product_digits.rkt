#lang racket

(define (product-digits n)
  (define (digit-iter current result)
    (if (> current 0)
        (digit-iter (quotient current 10)
                    (* result (remainder current 10)))
        result))
  (digit-iter n 1))