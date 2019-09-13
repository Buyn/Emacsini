;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; IVY CUSTOMIZATION
(require 'use-package)
(use-package ivy
	:ensure t
	;; :init
	;; (elpy-enable)
	:config
	(ivy-mode 1)
	(ido-mode nil)
	)
;; --------------------------------------
