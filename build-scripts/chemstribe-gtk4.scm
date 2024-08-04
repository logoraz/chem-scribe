;;;; chemscribe-gtk4.lisp - ChemScribe GTK4 Guix Package Manifest

;;; Commentary:
;;;
;;; Currently lists out packages intended to develop ChemScribe
;;;
;;; GNU Guix development manifest.  To start the CL REPL:
;;;
;;;   guix shell -m path/to/chemscribe-manifest.scm -- sbcl
;;;
;;;   For development, it is perhaps best to run a pure shell, i.e.
;;;
;;;   guix shell --pure -m /path/to/chemscribe-manifest.scm -- clasp-cl


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
   "cl-cairo2"
   "cl-gtk4"
   ;; Unit Tests
   "cl-lisp-unit2"
   ;; UIX & CL Bindings - GTK4 (Gnome ToolKit)
   "gtk"
   "gobject-introspection"
   "libadwaita"
   "gtksourceview"))
