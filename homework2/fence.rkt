#lang racket


(provide string-repeat)

(define (string-repeat str n)
  (define (repeat-iter i result)
    (if (> i n)
        result
        (repeat-iter (+ i 1) (string-append result str))))
    (repeat-iter 1 ""))

(define (fence n)
  (define (repetition) (round (+ 1 (log n))))
  (define (construct-fence dashes)
    (string-append "{" dashes ">" (~a n) "<" dashes "}"))
  (construct-fence (string-repeat "-" (repetition))))
