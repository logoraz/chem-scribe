;;;; chemscribe

;;; Commentary
;;;
;;; Coding Rules:
;;; Use `first' --> `car'
;;; Use `rest' --> `cdr'
;;;
;;; gtk4 --> gtk (package nickname)

(in-package :chemscribe)

;; Howdy!

(gtk:define-application (:name formula-builder
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
    (let ((dialog (gtk:make-about-dialog))
          (system (asdf:find-system :cl-gtk4)))
      (setf (gtk:about-dialog-authors dialog) (list (asdf:system-author system))
            (gtk:about-dialog-website dialog) (asdf:system-homepage system)
            (gtk:about-dialog-version dialog) (asdf:component-version system)
            (gtk:about-dialog-program-name dialog) (asdf:component-name system)
            (gtk:about-dialog-comments dialog) (asdf:system-description system)
            (gtk:about-dialog-logo-icon-name dialog) "application-x-addon")
      (values dialog)))

  (gtk:define-main-window (window (gtk:make-application-window
                                   :application gtk:*application*))
      (setf (gtk:window-title window) "ChemScribe: Formula Builder")
    (let ((header-bar (gtk:make-header-bar)))
      (let ((menu-button (gtk:make-menu-button)))
        (setf (gtk:menu-button-menu-model menu-button) (simple-menu-menu)
              (gtk:button-icon-name menu-button) "open-menu-symbolic")
        (gtk:header-bar-pack-end header-bar menu-button))
      (setf (gtk:window-titlebar window) header-bar))
    (let ((action (gio:make-simple-action :name "exit"
                                          :parameter-type nil)))
      (gio:action-map-add-action gtk:*application* action)
      (gtk:connect action "activate"
               (lambda (action param)
                 (declare (ignore action param))
                 (gtk::destroy-all-windows-and-quit))))
    (let ((action (gio:make-simple-action :name "about"
                                          :parameter-type nil)))
      (gio:action-map-add-action gtk:*application* action)
      (gtk:connect action "activate"
               (lambda (action param)
                 (declare (ignore action param))
                 (let ((dialog (menu-test-about-dialog)))
                   (setf (gtk:window-modal-p dialog) t
                         (gtk:window-transient-for dialog) window)
                   (gtk:window-present dialog)))))
    (let ((window-box (gtk:make-box :orientation gtk:+orientation-vertical+
                                    :spacing 0)))
      (let ((menu-bar (gtk:make-popover-menu-bar :model (simple-menu-menu))))
        (gtk:box-append window-box menu-bar))
      (let ((empty-box (gtk:make-box :orientation gtk:+orientation-vertical+
                                     :spacing 0)))
        (setf (gtk:widget-size-request empty-box) '(400 200))
        (gtk:box-append window-box empty-box))
      (setf (gtk:window-child window) window-box))
    (unless (gtk:widget-visible-p window)
      (gtk:window-present window))))

;; Enable slynk to connect to emacs.
(bt:make-thread
 (lambda () (create-server :port 4008 :dont-close t)))

;; (clsql:connect)
