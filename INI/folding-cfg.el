;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; ORIGAMI-MOD CUSTOMIZATION {{{
;; (load "~/INI/origami_cfg.el")
(load-file "~/INI/origami_triplebrase.el")
;; --------------------------------------
(use-package origami :ensure t
  :config
    (add-hook 'prog-mode-hook 
      (lambda ()
        (setq-local origami-fold-style 'triple-braces)
		; one of this slowepoking elpy
        ;; (origami-close-all-nodes (current-buffer))
        ;; (origami-mode)
		;; (define-key evil-normal-state-map "za" 'origami-forward-toggle-node)
		(define-key evil-normal-state-map "za" 'triple-braces-forward-togle)
		(define-key evil-normal-state-map "zA" 'origami-forward-toggle-node)
		(define-key evil-normal-state-map "zp" 'origami-forward-toggle-node)
		(define-key evil-normal-state-map "zj" 'origami-forward-fold)
		(define-key evil-normal-state-map "zk" 'origami-previous-fold)
		(define-key evil-visual-state-map "zf"
			'triple-braces-create-and-comment-on-rigion)
		(define-key evil-normal-state-map "zf" 
			'triple-braces-create-and-comment-on-line-end)
		)))
;; -------------------------------------- }}}
;; --------------------------------------
