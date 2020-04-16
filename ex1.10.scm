;アッカーマン関数
(define (A x y)
  (cond ((= y 0) 0)
       ((= x 0) (* 2 y))
       ((= y 1) 2)
       (else (A (- x 1)  n (A x (- y 1))))))
#|
> (A 1 10)
1024
> (A 2 4)
65536
> (A 3 3)
65536
|#

(define (f n) (A 0 n)) ; (f n) = 2n
(define (g n) (A 1 n)) ; n > 0のとき(g n) = 2^n
(define (h n) (A 2 n)) ; n > 0のとき(h n) = 2^h(n-1)
(define (k n) (* 5 n n)) ;(k n) = 5 * n^2