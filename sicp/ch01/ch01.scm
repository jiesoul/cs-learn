(define (square x) (* x x))


(define (max-sum x y z)
  (cond (and (> x y) (> y z)) (+ x y)
        (and (> y z) (> z x)) (+ y z)
        (and (> z x) (> x y)) (+ z x)))


