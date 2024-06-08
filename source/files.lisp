;;;; files.lisp

;;; Find Executable
;; Borrowed from https://gist.github.com/ryukinix/5273af4b25dec53ed9f078bd7e350d88
(defun executables ()
  (loop with path = (uiop:getenv "PATH")
        for p in (uiop:split-string path :separator ":")
        for dir = (probe-file p)
        when (uiop:directory-exists-p dir)
          append (uiop:directory-files dir)))
(defun find-executable (name)
  (find name (executables)
        :test #'equalp
        :key #'pathname-name))

