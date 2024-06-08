(defsystem "chemixir"
  :version "0.0.1"
  :author "Erik P. Almaraz"
  :license "Apache 2.0"
  :depends-on ()
  :components ((:module "source"
                :components
                ((:file "main"))))
  :description "Highly Extensible Chemical Formulation Builder with Regulatory Intellisense."
  :in-order-to ((test-op (test-op "chemixir/tests"))))

(defsystem "chemixir/tests"
  :author "Erik P. Almaraz"
  :license "Apache 2.0"
  :depends-on ("chemixir"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for chemixir."
  :perform (test-op (op c) (symbol-call :rove :run c)))
