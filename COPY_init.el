;; --------------------------------------
;; init.el --- Emacs configuration
;; INSTALL PACKAGES
;; --------------------------------------
(require 'package)
(add-to-list 'package-archives
;;        '("melpa" . "http://melpa.org/packages/") t)
       '("melpa" . "http://melpa.org/packages/") )
(add-to-list 'package-archives 
		 '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives 
		 '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; --------------------------------------
;; Automatically Installing Packages
;; --------------------------------------

;; M-x package-refresh-contents
;; before
;; M-x package-install RET evil
;; if you're going to call (package-initialize) yourself.
;;(setq package-enable-at-startup nil)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; --------------------------------------
;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(require 'evil)
(evil-mode t)
;; init.el ends here
