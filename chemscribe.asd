;;;; chemscribe.asd

#-asdf3.1 (error "ChemScribe requires ASDF 3.1.2")

(defsystem "chemscribe"
  :version "0.0.1"
  :author "Erik P. Almaraz"
  :license "Apache 2.0"
  :depends-on ("asdf"
               "bordeaux-threads"
               "slynk"
               "clsql"
               "md5"
               "cl-glib"
               "cl-gtk4")
  :components ((:module "source"
                :components ((:file "chemscribe"))))
  :description "Extensible Chemical Formula Builder with Regulatory Intellisense."
  :in-order-to ((test-op (test-op "chemscribe/tests"))))

(defsystem "chemscribe/tests"
  :author "Erik P. Almaraz"
  :license "Apache 2.0"
  :depends-on ("chemscribe"
               "rove")
  :components ((:module "tests"
                :components ((:file "main"))))
  :description "Test system for chemscribe."
  :perform (test-op (op c) (symbol-call :rove :run c)))
