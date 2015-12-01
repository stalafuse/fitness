(defun make-grid-world (dimensions)
  (make-array dimensions :initial-element 0))

(defun current-cell (x y) (cons x y))

(defun n (grid-world current-cell)
  (let ((new-x (- (car current-cell) 1)))
    (if (>= new-x 0)
      (cons new-x (cdr current-cell))
      current-cell)))

(defun s (grid-world current-cell)
  (let ((new-x (+ (car current-cell) 1)))
    (if (<= new-x (- (car (array-dimensions grid-world)) 1))
      (cons new-x (cdr current-cell))
      current-cell)))

(defun e (grid-world current-cell)
  (let ((new-y (+ (cdr current-cell) 1)))
    (if (<= new-y (- (cadr (array-dimensions grid-world)) 1))
      (cons (car current-cell) new-y)
      current-cell)))

(defun w (grid-world current-cell)
  (let ((new-y (- (cdr current-cell) 1)))
    (if (>= new-y 0)
      (cons (car current-cell) new-y)
      current-cell)))

(defun ne (grid-world current-cell)
  (let ((new-x (- (car current-cell) 1))
        (new-y (+ (cdr current-cell) 1)))
    (if (and (>= new-x 0)
             (<= new-y (- (cadr (array-dimensions grid-world)) 1)))
      (cons new-x new-y)
      current-cell)))

(defun nw (grid-world current-cell)
  (let ((new-x (- (car current-cell) 1))
        (new-y (- (cdr current-cell) 1)))
    (if (and (>= new-x 0) (>= new-y 0))
      (cons new-x new-y)
      current-cell)))

(defun se (grid-world current-cell)
  (let ((new-x (+ (car current-cell) 1))
        (new-y (+ (cdr current-cell) 1)))
    (if (and (<= new-x (- (car (array-dimensions grid-world)) 1))
             (<= new-y (- (cadr (array-dimensions grid-world)) 1)))
      (cons new-x new-y)
      current-cell)))

(defun sw (grid-world current-cell)
  (let ((new-x (+ (car current-cell) 1))
        (new-y (- (cdr current-cell) 1)))
    (if (and (<= new-x (- (car (array-dimensions grid-world)) 1))
             (>= new-y 0))
      (cons new-x new-y)
      current-cell)))

