;; --------------------------------------
;; init.el --- Emacs configuration
;; used in
;; (find-file "~/INI/folding-cfg.el")
;; --------------------------------------
;; OUTSHINE-MOD CUSTOMIZATION {{{
;; --------------------------------------
(use-package outshine :ensure t
  :quelpa (outshine :fetcher github :repo "alphapapa/outshine")
  :config
	;; (defvar outline-minor-mode-prefix "\M-#")
	(add-hook 'outline-minor-mode-hook 'outshine-hook-function)
	(add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
	;; (add-hook 'LaTeX-mode-hook 'outline-minor-mode)
	(add-hook 'python-mode-hook 'outline-minor-mode)
	)
;; -------------------------------------- }}}
