;;;; package.lisp --> chemscribe

;;; Commentary
;;;
;;; TOdO: 1. lookup how to properly :use packages with conflicting
;;;           namespaces...


(uiop:define-package :chemscribe
  (:use :cl)
  (:import-from :slynk #:create-server)
  (:export #:formula-builder))
