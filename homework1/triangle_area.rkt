#lang racket

(define (heron a b c)
  (define (multiply-squares x y)
    (* x x y y))
  (define (sum-of-squares a b c)
    (* 2
       (+ (multiply-squares a b)
          (multiply-squares a c)
          (multiply-squares b c))))
  (define (fourth-power a) (* a a a a))
  (* (/ 1 4)
     (sqrt (- (sum-of-squares a b c)
              (+ (fourth-power a)
                 (fourth-power b)
                 (fourth-power c))))))
