(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess))) ;guessは推定(値) /  英語がほんとうにだめ

(define (average x y)
  (/ (+ x y) 2))

#|(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
|#
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (* guess 0.001)))

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

(define (sqrt x)
  (sqrt-iter 1.0 x))
#| 1.7解答
小さい数のテストがうまくいかない例:(sqrt 0.0001)は0.01を返してほしいが、処理系は0.03230844833048122を返した。
大きい数のテストがうまくいかない例:(sqrt 1000000000000)は1000000.0を返すが、(sqrt 10000000000000)ではエラー。
なぜこうなるか？->
数が小さすぎると常に許容値0.001よりも小さいため常にtrueを返す。
数が大きすぎると,浮動小数点数の差が許容値0.001を下回ることがなく常にfalseを返す。

good-enough?の古い版
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

good-enough?の新しい版
差分が推定値に対してとても小さいもの(つまり許容誤差0.001)になったらとめる
(define (good-enough? guess x)
  (< (abs (- 1.0 (/ guess (improve guess x)))) ;推定値1と平均の差を見る
     0.001))
|#