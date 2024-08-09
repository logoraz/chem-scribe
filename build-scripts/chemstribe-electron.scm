;;;; chemscribe-electron.lisp - ChemScribe Electron Guix Package Manifest

;;; Commentary:
;;;
;;; Currently lists out packages intended to develop ChemScribe
;;;
;;; GNU Guix development manifest.  To start the CL REPL:
;;;
;;;   guix shell -m path/to/chemscribe-electron.scm -- sbcl
;;;
;;;   For development, it is perhaps best to run a pure shell, i.e.
;;;
;;;   guix shell --pure -m /path/to/chemscribe-electron.scm -- clasp-cl


;;; Reference:
;;; 1. https://guix.gnu.org/en/manual/devel/en/html_node/Writing-Manifests.html
;;; 2.
;;; 3.


;;; Code:


(specifications->manifest
 '(;; "sbcl"
   ;; "clasp-cl"
   ;; General CL Packages/Modules
   "cl-bordeaux-threads"
   "cl-lparallel"
   "cl-slynk"
   "cl-clsql"
   "cl-md5"
   ;; UIX & CL Bindings - cl-electron (Common Lisp Bindings for Electron)
   ;; "cl-electron" --> not ready, still in early development!
   ;; Unit Tests
   "cl-lisp-unit2"))
