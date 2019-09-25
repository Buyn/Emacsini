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
	;; (global-origami-mode nil)
	;; (setq python-shell-interpreter "python"
	;; 	python-shell-interpreter-args "-i")
	;; (global-set-key (kbd "C-SPC") nil)
	;; (define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
	)
(use-package flycheck 
	:ensure t
	;; :init
	;; (elpy-enable)
	:config
	(setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
	(add-hook 'elpy-mode-hook 'flycheck-mode)
	)
(use-package company-jedi 
	:ensure t
	;; :init
	;; (elpy-enable)
	:config
	(defun my/python-mode-hook ()
	(add-to-list 'company-backends 'company-jedi))
	(add-hook 'python-mode-hook 'my/python-mode-hook)
	(define-key evil-insert-state-map (kbd "C-SPC") 'company-jedi)

	)
;; --------------------------------------
