;;;; ChemScribe Guix Manifest

;;; Commentary:
;;;
;;; Currently lists out packages intended to develop ChemScribe
;;;
;;; GNU Guix development manifest.  To start the CL REPL:
;;;
;;;   guix shell -m path/to/chemscribe-manifest.scm -- sbcl
;;;
;;;   or
;;;
;;;   guix shell -m path/to/chemscribe-manifest.scm -- emacs
;;;

;;; Reference:
;;; 1. https://guix.gnu.org/en/manual/devel/en/html_node/Writing-Manifests.html

;;; Code:

(specifications->manifest
 '("sbcl"
   ;; clasp-cl
   "cl-bordeaux-threads"
   "cl-lparallel"
   "cl-iolib"
   "cl-nclasses"
   "cl-parenscript"
   "cl-ppcre"
   "cl-str"
   "cl-json"
   ;; UIX & CL Bindings

   ;; Unit Tests
   "cl-lisp-unit2"))

;; I can use clasp-cl, but would need to write a custom recipe, or use the
;; recipe they supply, first running Koga to download dependencies...
