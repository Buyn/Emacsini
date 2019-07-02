;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; AUTO-COMPLETE  CUSTOMIZATION
;; --------------------------------------
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
;; --------------------------------------
(require 'company)
(require 'evil)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-SPC") nil)
(define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
;; --------------------------------------
