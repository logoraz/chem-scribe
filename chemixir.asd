(defsystem "chemixir"
  :version "0.0.1"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "source"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "chemixir/tests"))))

(defsystem "chemixir/tests"
  :author ""
  :license ""
  :depends-on ("chemixir"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for chemixir"
  :perform (test-op (op c) (symbol-call :rove :run c)))
