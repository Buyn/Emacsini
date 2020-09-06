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
	(add-hook 'prog-mode-hook 'company-mode)
	;; (setq completion-styles "basic substring emacs22")
	(setq completion-styles '(partial-completion substring emacs22))
	(define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
	(setq company-minimum-prefix-length 10)
	(setq company-idle-delay nil)
	(setq company-show-numbers t)
	;; :bind ("C-c c" hydra-clock/body)
;; ***  END use-package 
  )
;; (require 'company)
;; (require 'company)
;; ** use-package company fuze search
;; *** defun program-mode-hook-customize : 
(defun program-mode-hook-customize (args)
  "comands fun list to customizing
	programing mode"
  (interactive "P")
		(display-line-numbers-mode t)
		(company-fuzzy-mode 1)
		(setq company-minimum-prefix-length 1)
		(setq company-show-numbers t)
		(setq company-idle-delay 0.1)
		(setq outshine-mode 1))
;; *** use-package company-fuzzy : 
(use-package company-fuzzy :ensure t
;; *** --------------------------------------
  ;; :defer 2
;; *** :init : 
 :init
  (setq company-require-match nil)            ; Don't require match, so you can still move your cursor as expected.
  (setq company-tooltip-align-annotations t)  ; Align annotation to the right side.
  (setq company-eclim-auto-save nil)          ; Stop eclim auto save.
  (setq company-dabbrev-downcase nil)         ; No downcase when completion.
;; *** :config : 
  :config
  ;; Enable downcase only when completing the completion.
  (defun jcs--company-complete-selection--advice-around (fn)
    "Advice execute around `company-complete-selection' command."
    (let ((company-dabbrev-downcase t))
      (call-interactively fn)))
  (advice-add 'company-complete-selection :around #'jcs--company-complete-selection--advice-around)
;; *** add-hook 'prog-mode-hook : 
	(add-hook 'prog-mode-hook (lambda () 
		(setq company-show-numbers t)
		(setq company-fuzzy-mode 1)
		(setq company-minimum-prefix-length 1)
		(setq company-idle-delay 0.1)))
;; ***  END use-package 
  )
;; (require 'company)
;; (company-fuzzy-mode 1)
;; * --------------------------------------
