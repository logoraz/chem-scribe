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
                     lisp-xyz)

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
       cl-electron ; -> consider developing for electron (instead of sdl2?)
       sdl2
       sdl2-ttf
       sdl2-image
       cl-sdl2
       cl-sdl2-ttf
       cl-sdl2-image
       cl-trivial-main-thread
       ;; Unit Tests
       cl-lisp-unit2))

(define cl-electron
  (let ((commit "")
        (revision ""))
    (package
      (name "cl-electron")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/atlas-engineer/cl-electron")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 ""))))
      (build-system asdf-build-system/sbcl)
      (inputs (list sbcl-cffi libiconv))
      (home-page "https://github.com/atlas-engineer/cl-electron")
      (synopsis "")
      (description "")
      (license license:bsd-3))))


