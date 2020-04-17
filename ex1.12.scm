(define (p-triangle m n)
  (if (or (= n 1) (= n m))
     1
     (+ (p-triangle (- m 1) (- n 1)) (p-triangle (- m 1) n))))