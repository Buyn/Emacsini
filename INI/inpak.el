;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
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
;; D:\Development\lisp\doc\Cfg\use-pac.txt
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
