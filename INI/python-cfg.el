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
;; *** init : 
	:defer t
	:init
	(elpy-enable)
;; *** config : 
	:config
	;; (elpy-enable)
	;; (ivy-mode 1)
	(company-mode 1)
	(setq compilation-scroll-output nil)
	;; not working from config onli from init and not from hooks
	;; (add-hook 'python-mode-hook 'elpy-mode)
	;; (add-hook 'python-mode-hook 'elpy-enable)
	;; (setq python-shell-interpreter "python"
	;; python-shell-interpreter-args "-i")
	;; findout what it do
;; *** define-key : 
	(define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
	(define-key evil-normal-state-map (kbd "M-e M-f M-p") 'elpy-goto-definition)
	(define-key evil-normal-state-map (kbd "M-e M-f M-P") 'elpy-goto-definition-other-window)
	(define-key evil-insert-state-map (kbd "<f8>") '(lambda() (interactive)

				(org-save-all-org-buffers)
				(save-some-buffers 'no-confirm)
				(evil-normal-state)
				(recompile)
				))
;; *** 	) : 
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
