;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; ORIGAMI-MOD CUSTOMIZATION {{{
;; (load "~/INI/origami_cfg.el")
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
		(define-key evil-normal-state-map "zA" 'origami-forward-toggle-node)
		(define-key evil-normal-state-map "zp" 'origami-forward-toggle-node)
		(define-key evil-normal-state-map "zj" 'origami-forward-fold)
		(define-key evil-normal-state-map "zk" 'origami-previous-fold)
		(define-key evil-visual-state-map "zf"
			'(lambda ()
				"create fold and add comment to it"
				(interactive)
				(setq start (region-beginning))
				(setq end (region-end))
				(deactivate-mark)
				(and (< end start)
					(setq start (prog1 end (setq end start))))
				(goto-char start)
				(beginning-of-line)
				(indent-according-to-mode)
				(insert comment-start)
				(setq start (point))
				(insert " " " {{{")
				(newline-and-indent)
				(goto-char end)
				(end-of-line)
				(and (not (bolp))
					(eq 0 (forward-line))
					(eobp)
					(insert ?\n))
				(indent-according-to-mode)
				(if (equal comment-end "")
					(insert comment-start " ;; }}}")
				(insert comment-end "}}}"))
				(newline-and-indent)
				(goto-char start)
				))
			(define-key evil-normal-state-map "zf";  {{{ 
			'(lambda ()
				"create fold and add comment to it"
				(interactive)
				(end-of-line) 
				(insert comment-start)
				;; (indent-according-to-mode)
				(setq start (point))
				(insert " " " {{{")
				(newline-and-indent)
				(indent-according-to-mode)
				(if (equal comment-end "")
					(insert comment-start " }}}")
				(insert comment-end "}}}"))
				(goto-char start)
				))
				; }}}
			)))
;; -------------------------------------- }}}
;; --------------------------------------
