;; --------------------------------------
;; init.el --- Emacs configuration
;; * used in
;; (find-file "~/INI/folding-cfg.el")
;; --------------------------------------
;; * OUTSHINE-MOD CUSTOMIZATION 
;; --------------------------------------
;; ** use-package outshine 
(use-package outshine :ensure t
  :quelpa (outshine :fetcher github :repo "alphapapa/outshine")
;; **  outshine config
  :config
;; *** binds
	;; (defvar outline-minor-mode-prefix "\M-#")
;; *** autoload
	;; (add-hook 'outline-minor-mode-hook 'outshine-hook-function)
	(add-hook 'outline-minor-mode-hook 'outshine-mode)
	(add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
	(add-hook 'python-mode-hook 'outline-minor-mode)
	;; (add-hook 'LaTeX-mode-hook 'outline-minor-mode)
;; *** theme customization
	;; (custom-theme-set-faces
	;; 'material
	;; `(outline-1 ((t (:height 1.25 :weight bold))))
	;; `(outline-2 ((t (:height 1.15 :weight bold))))
	;; `(outline-3 ((t (:height 1.05 :weight bold))))
	;; `(outline-4 ((t (:height 1.95 :weight bold))))
	;; `(outline-5 ((t (:height 1.85 :weight bold))))
	;; `(outline-6 ((t (:height 1.75 :weight bold))))
	;; `(outline-7 ((t (:height 1.65 :weight bold))))
;; ** END of use-package outshine 
	)
;; -------------------------------------- }}}
