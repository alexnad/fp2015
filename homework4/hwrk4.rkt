#lang racket

(define (f p g h) (λ(x) (and (p (g x)) (p (h x)))))

(define (fst pair)
  (car pair))

(define (snd pair)k
  (cdr pair))

(define (lmc frac1 frac2) (/ (* (snd frac1) (snd frac2))
                             (gcd (snd frac1) (snd frac2))))

(define (multiplied-numerators frac1 frac2)
  (cons (* (fst frac1) (/ (lmc frac1 frac2) (snd frac1)))
        (* (fst frac2) (/ (lmc frac1 frac2) (snd frac2)))))

(define (add-frac frac1 frac2)
  (define (add numerators denominator)
    (cons (+ (fst numerators)
             (snd numerators))
          denominator))
  (add (multiplied-numerators frac1 frac2) (lmc frac1 frac2)))
  

(define (substract-frac frac1 frac2)
  (define (substract numerators denominator)
    (cons (- (fst numerators)
             (snd numerators))
          denominator))
  (substract (multiplied-numerators frac1 frac2) (lmc frac1 frac2)))

(define (mult-frac frac1 frac2)
  (simplify-frac (cons (* (fst frac1) (fst frac2))
                       (* (snd frac1) (snd frac2)))))

(define (simplify-frac frac)
  (define (simplify divisor)
    (cons (/ (fst frac) divisor) (/ (snd frac) divisor)))
  (simplify (gcd (fst frac) (snd frac))))
