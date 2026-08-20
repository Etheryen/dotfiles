(defun my/fib (n)
  (if (<= n 1)
    n
    (+ (my/fib (- n 1)) (my/fib (- n 2)))))

(defun my/factorial (n)
  (if (= n 0)
      1
    (* n (my/factorial (- n 1)))))

(defun my/sum (items)
  (let ((curr (car items)) (rest (cdr items)))
    (cond
      ((not curr) 0)
;      ((not rest) curr)
      (t (+ curr (my/sum rest))))))

(defun my/count (items)
  (if (not (car items))
    0
    (+ 1 (my/count (cdr items)))))

(defun my/average (items)
  (if (not items)
      0
    (/ (my/sum items) (length items))))

(defun my/odd-items (items)
  (if (not items)
      nil
    (cons (car items) (my/odd-items (cdr (cdr items))))))

(defun my/even-items (items)
  (my/odd-items (cdr items)))

(my/fib 10)
(my/factorial 5)
(my/sum '(6 7 8))
(my/count '(6 7 8))
(my/average '(6 7 8))
(my/odd-items '(1 2 3 4))
(my/even-items '(1 2 3 4))

(setq first-num 1)
(cons first-num '(2 3))
(setq last-num 3)
(append '(1 2) (list last-num))


(cons 1 nil)
