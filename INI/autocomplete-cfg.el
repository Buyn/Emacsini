;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; * used in
;; (find-file "~/INI/dev-cfg.el")
;; --------------------------------------
;; * AUTO-COMPLETE  CUSTOMIZATION
;; ** old vanila setings
;; --------------------------------------
;; (setq tab-always-indent 'complete)
;; (add-to-list 'completion-styles 'initials t)
;; --------------------------------------
;; ** use-package company
(use-package company :ensure t
  ;; :defer 2
	:config
	(define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
	;; :bind ("C-c c" hydra-clock/body)
;; *** old setings
;; (require 'evil)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (global-set-key (kbd "C-SPC") nil)
;; (define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
;; ***  END use-package 
  )
(require 'company)
;; * --------------------------------------
