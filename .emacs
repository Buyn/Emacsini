;; --------------------------------------
;; .emacs --- Emacs configuration
;; --------------------------------------
;; * Start of manual file
;; --------------------------------------
(load "~/INI/init.el")
;; --------------------------------------
;; ** End of manual file
;; --------------------------------------
;; --------------------------------------
;; * START OF AUTOMATION 
;; --------------------------------------
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
(put 'set-goal-column 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-type (quote relative))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
	(elpy yasnippet-snippets s rainbow-delimiters quelpa-use-package pyvenv python-environment pkg-info outshine ob-translate material-theme lua-mode hydra highlight-indentation find-file-in-project expand-region evil-tabs epc company better-defaults)))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
