#lang racket

(define (series a b n)
  (define(series-iter a1 a2 i)
    (if(>= i n)
       a1
       (series-iter a2 (+ a1 a2) (+ i 1))))
  (series-iter a b 1))

(define (fibonacci n) (series 1 1 n))
(define (lucas n) (series 2 1 n))

(define (summed-member n) (+ (lucas n) (fibonacci n)))

(define (nth-sum-series a b n)
  (define(series-iter a1 a2 i result)
    (if(> i n)
       result
       (series-iter a2 (+ a1 a2) (+ i 1) (+ result a1))))
  (series-iter a b 1 0))

(define (nth-fibonacci-sum n) (nth-sum-series 1 1 n))
(define (nth-lucas-sum n) (nth-sum-series 2 1 n))

(define (lucas-fib-diff n)
  (- (lucas n)
     (fibonacci n)))
