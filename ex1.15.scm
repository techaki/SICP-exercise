(define (cube x)
  (* x x x))

(define (p x)
  (- (* 3 x)
     (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

#| a 手続きpは5回適用される
(sine 12.15)   
(p (sine 4.05))  
(p (p (sine 1.35)))
(p (p (p (sine 0.45)))) 
(p (p (p (p (sine 0.15)))))  
(p (p (p (p (p (sine 0.05))))))   
(p (p (p (p (p 0.05)))))  
|#

#| b Θ=log(a)
0.1未満になるまでaに1/3をn回掛けるからa/0.1 < 3^nで対数とってlog(a/0.1) < nlog(3)
|#