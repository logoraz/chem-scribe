;;;; package.lisp --> chemscribe

;;; Commentary
;;;
;;; TOdO: 1. lookup how to properly :use packages with conflicting
;;;           namespaces...


(uiop:define-package :chemscribe
  (:use :cl :gtk4) ;; remove :gtk4 from :use!
  (:import-from :slynk #:create-server)
  (:export #:formula-builder))
