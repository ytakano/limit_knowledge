; (eval l)
(define (eval0 l)
    (eval l '()))

; 1ステップだけ評価
; (eval ((car l) (cdr l)))
(define (eval1 l)
    (apply (eval0 (car l)) (cdr l)))

(define (L x y) (cons x y))

; 「xはxである」は証明できない
(define g
    '(lambda (x)
        (cons 'is-probable
            (L (L x (L x '())) '()) ; (x x)
            )))

; ゲーデル文G
; g(x) = 「xはxである」は証明できない
; G = g(g) = 「「xはxである」は証明できない」に自身を代入した文は証明できない
(print "(g g)\t\t\t= " ((eval0 g) g))

(print "\n(cadr (g g))\t\t= " (cadr ((eval0 g) g)))
(print "\n(eval (cadr (g g)))\t= " (eval1 (cadr ((eval0 g) g))))
