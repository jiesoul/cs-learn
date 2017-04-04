(define gcd
  (lambda (a b)
    (cond ((= a b) a)
          ((> a b) (gcd (- a b) b))
          ((< a b) (gcd (- b a) a)))))
