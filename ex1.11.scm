;再帰プロセス
(define (f n)
  (if (< n 3)
     n
     (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

#|
反復
n>=3 のときf(n)=f(n - 1) + 2 f(n - 2) + 3 f(n - 3)
つまり、n>=3のときf(n) = f(a)+2f(b)+3f(c)
aに(+ a (* 2 b) (* 2 c))、bにa、cにbを入れてcountを-1していく
|#
(define (f2 n)
  (define (iter a b c count)
    (if (< count 3)
       a
       (iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (if (< n 3)
     n
     (iter 2 1 0 n)))