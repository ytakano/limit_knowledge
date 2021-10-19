; let f x = (x x)
(define f '(lambda (x) (cons x (cons x '()))))

; (eval l)
(define (eval0 l)
    (eval l '()))

; 1ステップだけ評価
; (eval ((car l) (cdr l)))
(define (eval1 l)
    (apply (eval0 (car l)) (cdr l)))

(print "f\t\t\t\t= " f)
(print "(f f)\t\t\t\t= " ((eval0 f) f))
(print "(eval (f f))\t\t\t= " (eval1 ((eval0 f) f)))
(print "(eval (eval (f f)))\t\t= " (eval1 (eval1 ((eval0 f) f))))
(print "(eval (eval (eval (f f))))\t= " (eval1 (eval1 (eval1 ((eval0 f) f)))))
