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
  '(lambda (x) (L 'is-unprovable (L x x))))

(print "第一不完全性定理：Gもnot Gも証明できないようなGが存在する")

(print "\ng = " g)
(print "とする。")

;; ゲーデル文G
;; g(x) = 「xはxである」は証明できない
;; G = g(g) = 「「xはxである」は証明できない」に自身を代入した文は証明できない
(let (
      (G ((eval0 g) g))
      )
  (print "\n以下のようなGを考える（Gはゲーデル文）。")
  (print "G = (g g)")
  (print "  = " G)
  (print "  ;; 上式の引数を簡約")
  (print "  ;; (L (car G) (eval1 (cadr G)))")
  (print "  = " (L (car G) (eval1 (cadr G))))
  (print "  ;; Gと上式の引数が同じ")
  (print "  ;; (equal? G (eval1 (cadr G))) = " (equal? G (eval1 (cadr G))))
  (print "  = " (L 'is-unprovable 'G) " ; Gは証明できない")
  )

(print "\nGを証明可能と仮定する。")
(print "すると、(is-unprovable G)が正しいと証明可能となる。")
(print "つまり、Gは証明できないと証明できることになる。")
(print "背理法よりGは証明不可能。")

(print "\nnot Gを証明可能と仮定する。")
(print "ここで、")
(print "not G = not (is-provable G)")
(print "      = (provable G)")
(print "となる。")
(print "これより、not Gが証明可能となると、Gも証明可能でなければならなので矛盾。")
(print "背理法よりnot Gが証明不可能。")

(print "\nGもnot Gも証明できない。Q.E.D.")
