;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/dev-cfg.el")
;; --------------------------------------
;; --------------------------------------
;; * PYTHON-MOD CUSTOMIZATION
;; --------------------------------------
;; ** (use-package elpy
(require 'use-package)
(use-package elpy :ensure t
	:defer t
	:init
	(elpy-enable)
	:config
	;; (ivy-mode 1)
	;; (global-origami-mode nil)
	;; (setq python-shell-interpreter "python"
	;; python-shell-interpreter-args "-i")
	;; findout what it do
	;; (global-set-key (kbd "C-SPC") nil)
	(define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
	;; (com)
	)
;; ** (use-package flycheck 
(use-package flycheck 
	:ensure t
	;; :init
	;; (elpy-enable)
	:config
	(setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
	(add-hook 'elpy-mode-hook 'flycheck-mode)
	)
;; ** (use-package company-jedi 
;; (use-package company-jedi 
;; 	:ensure t
;; 	;; :init
;; 	;; (elpy-enable)
;; 	:config
;; 	(defun my/python-mode-hook ()
;; 	(add-to-list 'company-backends 'company-jedi))
;; 	(add-hook 'python-mode-hook 'my/python-mode-hook)
;; 	(define-key evil-insert-state-map (kbd "C-SPC") 'company-jedi)
;; 	)
;; --------------------------------------

;; * --------------------------------------
