;;;; chemscribe

;;; Commentary
;;;
;;; Coding Rules:
;;; Use `first' --> `car'
;;; Use `rest' --> `cdr'


(uiop:define-package :chemscribe
  (:use :cl :gtk4 :slynk)
  (:export #:formula-builder))

(in-package :chemscribe)

;; Howdy!

(define-application (:name formula-builder
                     :id "org.logoraz.chemscribe.simple-menu")
    (defun simple-menu-menu ()
      (let ((menu (gio:make-menu)))
        (let ((submenu (gio:make-menu)))
          (gio:menu-append-item
           submenu
           (gio:make-menu-item :model menu
                               :label "Open"
                               :detailed-action "app.open"))
          (gio:menu-append-item
           submenu
           (gio:make-menu-item :model menu
                               :label "Exit"
                               :detailed-action "app.exit"))
          (gio:menu-append-submenu menu "File" submenu))
        (let ((submenu (gio:make-menu)))
          (gio:menu-append-item
           submenu
           (gio:make-menu-item :model menu
                               :label "About"
                               :detailed-action "app.about"))
          (gio:menu-append-submenu menu "Help" submenu))
        (values menu)))

  (defun menu-test-about-dialog ()
    (let ((dialog (make-about-dialog))
          (system (asdf:find-system :cl-gtk4)))
      (setf (about-dialog-authors dialog) (list (asdf:system-author system))
            (about-dialog-website dialog) (asdf:system-homepage system)
            (about-dialog-version dialog) (asdf:component-version system)
            (about-dialog-program-name dialog) (asdf:component-name system)
            (about-dialog-comments dialog) (asdf:system-description system)
            (about-dialog-logo-icon-name dialog) "application-x-addon")
      (values dialog)))

  (define-main-window (window (make-application-window :application *application*))
      (setf (window-title window) "ChemScribe: Formula Builder")
    (let ((header-bar (make-header-bar)))
      (let ((menu-button (make-menu-button)))
        (setf (menu-button-menu-model menu-button) (simple-menu-menu)
              (button-icon-name menu-button) "open-menu-symbolic")
        (header-bar-pack-end header-bar menu-button))
      (setf (window-titlebar window) header-bar))
    (let ((action (gio:make-simple-action :name "exit"
                                          :parameter-type nil)))
      (gio:action-map-add-action *application* action)
      (connect action "activate"
               (lambda (action param)
                 (declare (ignore action param))
                 (gtk::destroy-all-windows-and-quit))))
    (let ((action (gio:make-simple-action :name "about"
                                          :parameter-type nil)))
      (gio:action-map-add-action *application* action)
      (connect action "activate"
               (lambda (action param)
                 (declare (ignore action param))
                 (let ((dialog (menu-test-about-dialog)))
                   (setf (window-modal-p dialog) t
                         (window-transient-for dialog) window)
                   (window-present dialog)))))
    (let ((window-box (make-box :orientation +orientation-vertical+
                                :spacing 0)))
      (let ((menu-bar (make-popover-menu-bar :model (simple-menu-menu))))
        (box-append window-box menu-bar))
      (let ((empty-box (make-box :orientation +orientation-vertical+
                                 :spacing 0)))
        (setf (widget-size-request empty-box) '(400 200))
        (box-append window-box empty-box))
      (setf (window-child window) window-box))
    (unless (widget-visible-p window)
      (window-present window))))

;; Enable slynk to connect to emacs.
(bt:make-thread
 (lambda () (create-server :port 4008 :dont-close t)))

;; sbcl specific
;; (sb-thread:make-thread
;;  (lambda () (create-server :port 4008 :dont-close t)))
