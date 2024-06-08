(defpackage chemixir/tests/main
  (:use :cl
        :chemixir
        :rove))

(in-package :chemixir/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :chemixir)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
