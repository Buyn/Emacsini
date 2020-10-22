;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file-other-frame "~/INI/fullscreen-cfg.el")
;; --------------------------------------
;; * MINIMAP-MODE CUSTOMIZATION 
;; --------------------------------------
;; ** use-package evil
(use-package minimap
							:ensure t
;; ** :config : 
	:config
	;; (minimap-mode)
	;; (setq minimap-recreate-windo nil)
	;; (setq minimap-major-modes nil)
	(setq minimap-width-fraction 0.1)
	(setq minimap-minimum-width 0.03)
	;; (setq minimap-major-modes '(prog-mode, org-mode, help-mode))
	;; (setq minimap-major-modes '(prog-mode))
	(setq minimap-major-modes '(prog-mode org-mode Info-mode))
;; ** END of use-package minimap-mode
  )
;; ** Docs
;; After installation, simply use M-x minimap-mode to toggle activation of the minimap.
;; Use 'M-x customize-group RET minimap RET' to adapt minimap to your needs.
;; --------------------------------------
;; ** --------------------------------------
;; * SUBLIMITY-MODE CUSTOMIZATION
;; --------------------------------------
;; ** use-package 
;; (use-package sublimity
;; 							:ensure t
;; ** :config : 
	;; :config
	;; 	(sublimity-map-set-delay 1)
;; ** END of use-package minimap-mode
  ;; )
;; ** Docs
;; https://github.com/zk-phi/sublimity
;; (require 'sublimity)
;; (require 'sublimity-scroll)
;; (require 'sublimity-map) ;; experimental
;; (require 'sublimity-attractive)
;; then call command M-x sublimity-mode (or put the following expression in your init file).
;; (sublimity-mode 1)
;; (sublimity-mode 0)
;; (sublimity-map-set-delay 1)
;; (setq sublimity-map-size 20)
;; (setq sublimity-map-fraction 0.01)
;; (setq sublimity-map-text-scale -90)

;; --------------------------------------
;; ** --------------------------------------
;; *  --------------------------------------
