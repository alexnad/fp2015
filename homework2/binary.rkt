#lang racket

(provide to-binary-string)
(provide string-reverse)


(define (string-reverse str)
  (define (reverse-iter length i result)
    (if (>= i length)
        result
        (reverse-iter length (+ i 1) (string-append (~a (string-ref str i)) result))))
  (reverse-iter (string-length str) 0 ""))

(define (to-binary-string n)
  (define (decimal->binary number result)
    (if (> number 0)
        (decimal->binary (quotient number 2) (string-append (~a (remainder number 2)) result))
        result))
  (decimal->binary n ""))


(define (from-binary-string binary-str)
  (define (binary->decimal n)
    (if (> n 0)
        (+ (remainder n 10) (* 2 (binary->decimal (quotient n 10))))
        n))
  (binary->decimal (string->number binary-str)))