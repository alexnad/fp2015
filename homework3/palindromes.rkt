#lang racket

(require "../homework2/binary.rkt")

(define (p-score n)
  (define (reverse-num n) (string->number (string-reverse(~a n))))
  (define (palindrome? num) (string=? num (string-reverse num)))
  (if (palindrome? (~a n))
      1
      (+ 1 (p-score (+ n (reverse-num n))))))