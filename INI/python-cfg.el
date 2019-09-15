;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; PYTHON-MOD CUSTOMIZATION
;; --------------------------------------
(require 'use-package)
(use-package elpy
	:ensure t
	:init
	(elpy-enable)
	:config
	(ivy-mode 1)
	(global-origami-mode nil)
	)
;; --------------------------------------
