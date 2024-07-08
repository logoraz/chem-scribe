;;;; scratch.lisp

;;; Example of the Mightly Loop: Fibonacci Sequence
(defun fibonacci (limit)
  (loop :for a := 0 :then b
        :and b := 1 :then (+ a b)        
        :repeat limit
        :collect a))

;;; Example - Functional Calculator
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

;;; Definiing Systems

;; A system is a collection of Lisp files that together constitute an application or a
;; library, and that should therefore be managed as a whole. A system definition
;; describes which source files make up the system, what the dependencies among them are,
;; and the order they should be compiled and loaded in.

;; ASDF is the standard build system for Common Lisp. It is shipped in most Common Lisp
;; implementations. It includes UIOP, “the Utilities for Implementation- and
;; OS- Portability”.

;; Using quicklisp -> issue with Guix finding micros...
;; See:  https://www.quicklisp.org/beta/

;; See Advanced Dependencies Management
;; -> https://lispcookbook.github.io/cl-cookbook/getting-started.html
;;    ASDF and Quicklisp loadable directories:
;;   |--> ~/common-lisp/
;;   |--> ~/quicklisp/local-projects/
;;   |--> ~/.local/share/common-lisp/source/
;;
;; A library installed here is automatically available for every project.

;; Quicklisp Initialization
;; Load quicklisp - not sure why it isn't being loaded in ~/.sbclrc file...
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))
