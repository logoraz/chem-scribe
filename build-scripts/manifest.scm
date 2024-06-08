;;;; ChemRoots Guix Manifest

;;; Commentary:
;;
;; Currently lists out packages intended to develop ChemRoots
;;
;; GNU Guix development manifest.  To start the CL REPL:
;;
;;   guix shell -m path/to/manifest.scm -- sbcl

;;; Code:

(use-package-modules lisp 
                     lisp-xyz
                     )

(packages->manifest
 (list sbcl
       ; clasp
       cl-bordeaux-threads
       cl-iolib
       cl-lparallel
       cl-nclasses
       cl-parenscript
       cl-ppcre
       cl-spinneret
       cl-str
       cl-json
       ;; UIX & CL Bindings
       sdl2
       sdl2-ttf
       sdl2-image
       cl-sdl2
       cl-sdl2-ttf
       cl-sdl2-image
       cl-trivial-main-thread
       ;; Unit Tests
       cl-lisp-unit2))
