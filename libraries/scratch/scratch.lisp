;;;; scratch.lisp

;;; Example of the Mightly Loop: Fibonacci Sequence
(defun fibonacci (limit)
  (loop :for a := 0 :then b
        :and b := 1 :then (+ a b)        
        :repeat limit
        :collect a))

;;; Example - Functional Calculator in Common Lisp
(defun make-calculator (current-value)
  #'(lambda (operation)
      (setf current-value (funcall operation current-value))))

(defun get-result (calculator)
  (funcall calculator (lambda (value)
                        value)))

(defun add! (calculator x)
  (funcall calculator (lambda (value)
                        (+ value x))))

(defun subtract! (calculator x)
 (funcall calculator (lambda (value)
                       (- value x))))

(defun multiply! (calculator x)
  (funcall calculator (lambda (value)
                        (* value x))))

(defun divide! (calculator x)
  (if (eql x 0) (print "Division by zero is undefined!")
      (funcall calculator (lambda (value)
                            (/ value x)))))

(defun clear! (calculator)
  (calculator (lambda (value) 0)))

(defvar *test-calc* (make-calculator 0))

;; Test
(progn
  (get-result *test-calc*)
  (add! *test-calc* 4)
  (subtract! *test-calc* 2)
  (multiply! *test-calc* 2)
  (divide! *test-calc* 1)
  (get-result *test-calc*))

;;; Eample - Function setf-expander
;; Ref lem/src/color-theme.lisp

(defvar *current-theme* nil)

(defun current-theme ()
  *current-theme*)

(defun (setf current-theme) (theme)
  (setf *current-theme* theme))
