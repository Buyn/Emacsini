;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; EVIL-MOD CUSTOMIZATION
;; --------------------------------------
(require 'evil)
(evil-mode t)
;; --------------------------------------
;; Setings  {{{
;; (setq evil-mode-line-format nil
;;       evil-insert-state-cursor '(bar "White")
;;       evil-visual-state-cursor '(box "#F86155"))
;; --------------------------------------
;; (define-key key-translation-map (kbd "ch") (kbd "C-h"))
;; (define-key evil-normal-state-map "c" nil)
;; (define-key evil-motion-state-map "cu" 'universal-argument)
;; -------------------------------------- }}}
;; Clipboard  {{{
(setq x-select-enable-clipboard nil)
;; (fset 'evil-visual-update-x-selection 'ignore)
;; (setq save-interprogram-paste-before-kill t)
(define-key evil-normal-state-map (kbd "M-c M-y") '(lambda() (interactive)
					(setq x-select-enable-clipboard t)
					(kill-ring-save (region-beginning) (region-end))
					(setq x-select-enable-clipboard nil)))
(define-key evil-normal-state-map (kbd "M-c M-x") '(lambda() (interactive)
					(setq x-select-enable-clipboard t)
					(setq tmp-region-beginning (region-beginning))
					;; (message "set region")
					(setq tmp-region-end (region-end))
					(kill-ring-save (region-beginning) (region-end))
					(kill-region tmp-region-beginning tmp-region-end)
					(setq tmp-region-beginning nil)
					;; (message "set region")
					(setq tmp-region-end nil)
					(setq x-select-enable-clipboard nil)
					))
(define-key evil-normal-state-map (kbd "M-c M-X") '(lambda() (interactive)
					(setq x-select-enable-clipboard t)
					(evil-delete-whole-line nil  nil)
					(setq x-select-enable-clipboard nil)
					(message "shift is prest")
					))
(define-key evil-normal-state-map (kbd "M-c M-p") '(lambda() (interactive)
								(setq x-select-enable-clipboard 1)
								(yank)
								(setq x-select-enable-clipboard nil)))
(define-key evil-normal-state-map (kbd "M-c M-o") '(
					lambda() (interactive)
								(setq x-select-enable-clipboard 1)
								(evil-insert-newline-below)
								(yank)
								(setq x-select-enable-clipboard nil)))
(define-key evil-normal-state-map (kbd "M-c M-t") '(
								lambda() (interactive)
								(setq x-select-enable-clipboard (not x-select-enable-clipboard))))
;; -------------------------------------- }}}
;; Movements  {{{
(define-key evil-normal-state-map "gl" 'move-end-of-line)
(define-key evil-normal-state-map "gh" 'move-beginning-of-line)
(define-key evil-normal-state-map (kbd "gj") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "gk") 'evil-previous-visual-line)
;; --------------------------------------  }}}
;; Grabing  {{{
(define-key evil-normal-state-map (kbd "M-m M-k") 'move-line-up)
(define-key evil-normal-state-map (kbd "M-m M-j") 'move-line-down)
;FIXME: move selected
;TODO: meta m+p copy line \ selection
;; -------------------------------------- }}}
;; Insert State F2 save {{{
(define-key evil-insert-state-map (quote [f2]) '(lambda() (interactive)
												  (save-buffer)
								(evil-normal-state)))
(define-key evil-replace-state-map(quote [f2]) '(lambda() (interactive)
								(save-buffer)
								(evil-normal-state)))
(define-key evil-insert-state-map(kbd "M-<f2>") '(lambda() (interactive)
								(org-save-all-org-buffers)
								(evil-normal-state)))
;; -------------------------------------- }}}
;; ONE CHAR ADD  {{{
(load "~/ELs/Evil/onecharadd.el")
(define-key evil-normal-state-map (kbd "SPC") 'addone-char-into-normal-evil)
(define-key evil-normal-state-map (kbd "RET") 'addone-char-after-normal-evil)
;; --------------------------------------  }}}
;; --------------------------------------
