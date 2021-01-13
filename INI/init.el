;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; * INSTALL PACKAGES
(load "~/INI/inpak.el")
;; --------------------------------------
;; * VANILA CUSTOMIZATION
(load "~/INI/vanila_cfg.el")
;; --------------------------------------
;; * EVIL-MOD CUSTOMIZATION
(load "~/INI/evil-mod-cfg.el")
;; --------------------------------------
;; * WWW CUSTOMIZATION
;; (with-eval-after-load 'evil
;;   (define-key evil-motion-state-map (kbd "g l") 'evil-end-of-line))
;; (eval-after-load "~/INI/www-cfg.el")
;; (find-file-other-frame "~/INI/www-cfg.el") 
(use-package eww
  :config
;; (find-file-other-frame "~/INI/org_agend_cfg.el")
	(load "~/INI/www-cfg.el"))
;; --------------------------------------
;; * INTERFACE-MODS CUSTOMIZATION
(load "~/INI/interface-mods.el")
;; --------------------------------------
;; * ORG-MODE CUSTOMIZATION
(load "~/INI/org-cfg.el")
;; --------------------------------------
;; * FRAME & WINDOWS CONTROL-MODS CUSTOMIZATION
(load "~/INI/frame-control.el")
;; --------------------------------------
;; * FOLDING-MODS CUSTOMIZATION
(load "~/INI/folding-cfg.el")
;; --------------------------------------
;; * LITERARY-MODS CUSTOMIZATION
;; (find-file "~/INI/lit-cfg.el") 
(load "~/INI/lit-cfg.el")
;; --------------------------------------
;; * DEVELOPMENT-MODs CUSTOMIZATION
(load "~/INI/dev-cfg.el")
;; --------------------------------------
;; * HYDRA CUSTOMIZATION
(load "~/INI/hydra-cfg.el")
;; --------------------------------------
;; * ADVNSED SELECTIONS CUSTOMIZATION
(load "~/INI/advnsed-selections-cfg.el")
;; --------------------------------------
;; * LOAD BUYN's ELISP DEFUNS
;; (find-file "~/ELs/BuYn/shell.el")
(load "~/ELs/BuYn/shell.el")
;; --------------------------------------
;; * NOT USED
;; ** TIME TRACKING-MODs CUSTOMIZATION
;; (load "~/INI/time-tracking-cfg.el")
;; --------------------------------------
;; * END OF LOAD
(message "Load of init.el is ended")
;; --------------------------------------
;; init.el ends here
;; --------------------------------------
