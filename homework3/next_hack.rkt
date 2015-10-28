#lang racket

(require "../homework2/binary.rkt")

(define (next-hack n)
  (define (odd-num-ones? binary-str len)
    (if (odd? len)
        (char=? #\1 (string-ref binary-str (quotient len 2)))
        #f))
  (define (hack? binary-str)
    (and (string=? binary-str (string-reverse binary-str))
         (odd-num-ones? binary-str (string-length binary-str))))
  (define (next-iter num)
    (if (hack? (to-binary-string num))
        num
        (next-iter (+ num 1))))
  (next-iter (+ n 1)))
