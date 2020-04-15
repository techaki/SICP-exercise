(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
         (else else-clause)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
       guess
       (sqrt-iter (improve guess x) x)))

(define (sqrt-iter-new-if guess x)
  (new-if (good-enough? guess x)
            guess
            (sqrt-iter-new-if (improve guess x ) x)))
#| 1.6解答
if式は、(if <predicate> <consequnt> <alternative>)の三引数をもち、はじめにpredicateが評価される。
しかし、condを使って定義したnew-ifは特殊形式でないため、作用的順序で評価される。
つまり、<predicate>が評価されるまえに、sqrt-iter-new-ifの中身が評価される。
そのため、sqrt-iter-new-ifが無限に再帰して停止しない。
|#