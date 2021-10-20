;; (eval l)
(define (eval0 l)
  (eval l '()))

;; 1ステップだけ評価
;; (eval ((car l) (cdr l)))
(define (eval1 l)
  (apply (eval0 (car l)) (cdr l)))

(define (L x y) (cons x (cons y '())))

;; 「xはxである」は証明できない
(define g
  '(lambda (x) (L 'is-provable (L x x))))

;; ゲーデル文G
;; g(x) = 「xはxである」は証明できない
;; G = g(g) = 「「xはxである」は証明できない」に自身を代入した文は証明できない
(print "(g g)\t\t\t\t\t= " ((eval0 g) g))

(print "(cadr (g g))\t\t\t\t= " (cadr ((eval0 g) g)))
(print "(eval (cadr (g g)))\t\t\t= " (eval1 (cadr ((eval0 g) g))))
(print "(eval (cadr (eval (cadr (g g)))))\t= " (eval1 (cadr (eval1 (cadr ((eval0 g) g))))))
