#|
x/y^2 + 2y / 3
-> (/ (+ (/ x (* y y)) (* 2 y)) 3)
-> (/ (+ (/ x (square y) (*2 y)) 3)
|#

(define (square guess)
  (* guess guess))

(define (improve guess x) 
   (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x) 
   (= (improve guess x) guess))

(define (cubic-root-iter guess x)
  (if (good-enough? guess x)
     guess
     (cubic-root-iter (improve guess x) x)))

(define (cubic-root x)
 (cubic-root-iter 1.0 x))