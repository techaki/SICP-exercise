(define (square x)
  (* x x))
(define (sum-of-square x y)
  (+ (square x) (square y)))
(define (my-max x y)
  (if (> x y) x y))
(define (my-min x y)
  (if (< x y) x y))
(define (two-out-of-three-sum-of-square a b c)
  (sum-of-square (my-max a b) (my-max (my-min a b) c)))
;(two-out-of-three-sum-of-square 1 2 3)
; 13

