;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * WINDMOVE&FRAMEMOVE SETUP{{{
;; --------------------------------------
;; ** Seting up
(require 'cl) ;;used to Fix error if theres an error with above code
(load "~/.emacs.d/Els/framemove/framemove.el")
(require 'framemove)
    (windmove-default-keybindings)
    (setq framemove-hook-into-windmove t) ;;Hook framemove into windmove keys
;; Common lisp stuff to fix windmove/framemove 
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;; --------------------------------------
;; ** Remap windmove keys to home keys
(global-set-key (kbd "M-h") nil)
(global-set-key (kbd "M-h") 'windmove-left)
(define-key org-mode-map (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-j") nil)
(global-set-key (kbd "M-j") 'windmove-down)
(define-key org-mode-map (kbd "M-j") 'windmove-down)
;; no  such variables error
;; (define-key c-mode-base-map (kbd "M-j") 'windmove-down)
;; (define-key c++-mode-map  (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") nil)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-l") nil)
(global-set-key (kbd "M-l") 'windmove-right)
;; --------------------------------------
;; --------------------------------------
;; * EVIL TABS  {{{
;; ** use-package evil
(use-package evil-tabs :ensure t
;; ** :config : 
	:config
	(global-evil-tabs-mode t)
	(evil-ex-define-cmd "tabc[lone]" 'elscreen-clone)
	(evil-ex-define-cmd "tabcl[ose]" 'elscreen-kill)
	(elscreen-toggle-display-tab)
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
;; * FRAME SIZE&POSITION CONTROL KEYS;  {{{
(global-set-key (kbd "M-<kp-7>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 0 0)))
(global-set-key (kbd "M-<kp-9>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 1280 0)))
(global-set-key (kbd "M-<kp-8>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 640 0)))
(global-set-key (kbd "M-<kp-4>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 0 360)))
(global-set-key (kbd "M-<kp-5>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 640 360)))
(global-set-key (kbd "M-<kp-6>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 1280 360)))
(global-set-key (kbd "M-<kp-1>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 0 549)))
(global-set-key (kbd "M-<kp-2>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 640 549)))
(global-set-key (kbd "M-<kp-3>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 1280 549)))
(global-set-key (kbd "M-<kp-subtract>") '(lambda() (interactive)
				(set-frame-size (selected-frame) 75 25)))
(global-set-key (kbd "C-M-<kp-subtract>") '(lambda() (interactive)
				(set-frame-size (selected-frame) 75 35)))
;; --------------------------------------
;; * FRAMES&BUFFER OPEN\CLOSE\SWITCH   {{{
;; ** Open new frames 
(global-set-key (kbd "M-g M-t M-t") 'make-frame-command)
;; (define-key evil-normal-state-map "gtt" 'make-frame-command)
(global-set-key (kbd " M-g M-t M-f") 'find-file-other-frame)
(global-set-key (kbd " M-g M-t M-b") 'switch-to-buffer-other-frame)
(define-key evil-normal-state-map "ZO" 'switch-to-buffer-other-frame)
(global-set-key (kbd " M-g M-t M-d") 'ido-dired-other-frame)
(define-key evil-normal-state-map (kbd "gbb") '(lambda() (interactive)
			(display-buffer (last-buffer))))
;; --------------------------------------
;; ** Help in New Frame   ***  {{{
;; (define-key evil-normal-state-map (kbd " M-g M-t M-j") 'other-frame)
;; (define-key evil-normal-state-map (kbd " M-g M-t M-k") 'previous-multiframe-window)
;; ;;(define-key evil-normal-state-map "gth" 'other-frame -2)
;;(define-key evil-normal-state-map "gtl" 'other-frame 2)
(global-set-key (kbd " M-g M-t M-h M-l") 'find-function-on-key-other-frame)
(global-set-key (kbd " M-g M-t M-h M-k") 'find-function-on-key-other-frame)
(global-set-key (kbd " M-g M-t M-h M-f") 'describe-function)
(global-set-key (kbd " M-g M-t M-h M-a") 'xref-find-definitions-other-frame)
;; --------------------------------------
;; ** FRAMS CLOSE  {{{
(define-key evil-normal-state-map "ZX" '(lambda() (interactive)
					(kill-buffer (current-buffer))
					(evil-quit)))
(define-key evil-normal-state-map "ZA" '(lambda() (interactive)
					(kill-buffer (current-buffer))
					))
(define-key evil-normal-state-map "ZD" '(lambda() (interactive)
					(kill-buffer (current-buffer))
					))
;; ** Buffer control  {{{
(define-key evil-normal-state-map "ZI" '(lambda() (interactive)
					(ivy-switch-buffer)))
(define-key evil-normal-state-map "ZH" '(lambda() (interactive)
					(previous-buffer)))
(define-key evil-normal-state-map "ZL" '(lambda() (interactive)
					(evil-next-buffer)))
(define-key evil-normal-state-map "ZK" '(lambda() (interactive)
					(unbury-buffer)))
(define-key evil-normal-state-map "ZJ" '(lambda() (interactive)
					(bury-buffer)))
(define-key evil-normal-state-map "ZN" '(lambda() (interactive)
					(evil-buffer-new 0 "*new*")))
;; --------------------------------------
;; * FULLSCREEN-MOD CUSTOMIZATION;  {{{
(load "~/INI/fullscreen-cfg.el")
;; --------------------------------------
; }}}
;; --------------------------------------
;; * NOT USED;  {{{
;; (global-set-key (kbd "<kp-subtract>") 'xah-close-current-buffer)
;; (global-set-key (kbd "<kp-divide>") 'xah-previous-user-buffer)
;; (global-set-key (kbd "<kp-multiply>") 'xah-next-user-buffer)
;; (global-set-key (kbd "<kp-decimal>") 'other-window)
;; (global-set-key (kbd "<C-kp-divide>") 'xah-previous-emacs-buffer)
;; (global-set-key (kbd "<C-kp-multiply>") 'xah-next-emacs-buffer)
;; --------------------------------------
;; --------------------------------------
