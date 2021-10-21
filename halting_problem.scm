;; (eval l)
(define (eval0 l)
  (eval l '()))

;; 1ステップだけ評価
;; (eval ((car l) (cdr l)))
(define (eval1 l)
  (apply (eval0 (car l)) (cdr l)))

(define (L x y) (cons x (cons y '())))

;; 停止判定
;; #tか#tの場合を試す必要あり
(define (halt? f arg) #f)

(define (loop) (loop))

;; (f m)が停止すると判定されたら無限ループ
;; (f m)が停止しないと判定されたら停止
(define m '(lambda (f)
	     (if (halt? f m)
		 (loop)
		 '())))

;; (m m)が停止することは判定可能か？
;;
;; (m m)が停止すると判定されると仮定 -> 実際には停止しないので矛盾
;; (m m)が停止しないと判定されると仮定 -> 実際には停止するので矛盾
((eval0 m) m)
