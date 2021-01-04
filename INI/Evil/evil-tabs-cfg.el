;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/evil-mod-cfg.el")
;; --------------------------------------
;; --------------------------------------
;; * EVIL TABS  
;; ** use-package evil-tabs
(use-package evil-tabs :ensure t
;; ** :config : 
	:config
	(global-evil-tabs-mode t)
	(evil-ex-define-cmd "tabc[lone]" 'elscreen-clone)
	(evil-ex-define-cmd "tabcl[ose]" 'elscreen-kill)
	(elscreen-toggle-display-tab)
	;; (setq elscreen-display-tab nil)
  ;; :bind ("C-c c" hydra-clock/body)
;; ** END of use-package evil-tabs
  )
;; ** Docs
;; --------------------------------------
;; :tabnew
;; :tabclone
   ;; (evil-ex-define-cmd "tabe[dit]" 'evil-tabs-tabedit)  
   ;; (evil-ex-define-cmd "tabclone" 'elscreen-clone)  
   ;; (evil-ex-define-cmd "tabc[lose]" 'elscreen-kill)  
   ;; (evil-ex-define-cmd "tabd[isplay]" 'elscreen-toggle-display-tab)  
   ;; (evil-ex-define-cmd "tabg[oto]" 'elscreen-goto)  
   ;; (evil-ex-define-cmd "tabo[nly]" 'elscreen-kill-others)  
   ;; (evil-ex-define-cmd "tabnew" 'elscreen-create)  
   ;; (evil-ex-define-cmd "tabn[ext]" 'elscreen-next)  
   ;; (evil-ex-define-cmd "tabp[rev]" 'elscreen-previous)  
   ;; (evil-ex-define-cmd "tabr[ename]" 'elscreen-screen-nickname)  
   ;; (evil-ex-define-cmd "tabs[elect]" 'elscreen-select-and-goto)  
   ;; (evil-ex-define-cmd "tabw[ith]" 'elscreen-find-and-goto-by-buffer)  
   ;; (evil-ex-define-cmd "q[uit]" 'evil-tab-sensitive-quit)  

;; --------------------------------------
;; --------------------------------------
;; * TAB Functions
;; ** make new indirect tab :
(defun make-new-indirect-tab (name)
  "Make new tab and indirect bufer with name"
  (interactive)
	(setq minimap-major-modes '())
	(clone-indirect-buffer name nil)
	(elscreen-create)
	;; (switch-to-buffer "evil-tabs-cfg.el<2>"))
	(switch-to-buffer name))

;; --------------------------------------
;; ** gen-name-for-curennt-indirect-buffer : 
(defun gen-name-for-curennt-indirect-buffer (ender)
  "genarate name for indirect buffer
		on curennt buffer name"
  ;; (interactive "P")
	(concat (buffer-name) ender)
  ) 
;; (gen-name-for-curennt-indirect-buffer "<2>")
;; ** next-or-make-new-tab 
(defun next-or-make-new-tab ()
  "Swircg on next tab or
		make new tab and open in it indirect buffer"
  (interactive)
		(let ((num-of-scr (elscreen-get-number-of-screens))) (cond
			((= num-of-scr 1)
				(make-new-indirect-tab
				(gen-name-for-curennt-indirect-buffer "<2>")))
			((= num-of-scr 2)
						(elscreen-next))
			((= num-of-scr 3)
						(elscreen-next)))))
;; *  --------------------------------------
