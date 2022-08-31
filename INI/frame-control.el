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
;; * FRAME SIZE&POSITION CONTROL
;; ** FRAME POSITION LIST
;; *** MONITOR 1 FRAME POSITION LIST
(setq buyn-monitr-1-position-7 '(0		 0))
(setq buyn-monitr-1-position-8 '(640	 0))
(setq buyn-monitr-1-position-9 '(1280	 0))
(setq buyn-monitr-1-position-4 '(0		 360))
(setq buyn-monitr-1-position-5 '(640	 360))
(setq buyn-monitr-1-position-6 '(1280	 360))
(setq buyn-monitr-1-position-1 '(0		 549))
(setq buyn-monitr-1-position-2 '(640	 549))
(setq buyn-monitr-1-position-3 '(1280	 549))
;; *** MONITOR 2 FRAME POSITION LIST
(setq buyn-monitr-2-position-7 '(1920	 35))
(setq buyn-monitr-2-position-8 '(2115	 35))
(setq buyn-monitr-2-position-9 '(2310	 35))
(setq buyn-monitr-2-position-4 '(1920	 360))
(setq buyn-monitr-2-position-5 '(2115	 360))
(setq buyn-monitr-2-position-6 '(2310	 360))
(setq buyn-monitr-2-position-1 '(1920  790))
(setq buyn-monitr-2-position-2 '(2115  790))
(setq buyn-monitr-2-position-3 '(2310	 790))
;; ** FRAME POSITION CONTROL KEYS
;; *** MONITOR 1
(global-set-key (kbd "M-<kp-7>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-1-position-7)
													(cadr buyn-monitr-1-position-7))))
(global-set-key (kbd "M-<kp-9>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-1-position-9)
													(cadr buyn-monitr-1-position-9))))
(global-set-key (kbd "M-<kp-8>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-1-position-8)
													(cadr buyn-monitr-1-position-8))))
(global-set-key (kbd "M-<kp-4>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-1-position-4)
													(cadr buyn-monitr-1-position-4))))
(global-set-key (kbd "M-<kp-5>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-1-position-5)
													(cadr buyn-monitr-1-position-5))))
(global-set-key (kbd "M-<kp-6>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-1-position-6)
													(cadr buyn-monitr-1-position-6))))
(global-set-key (kbd "M-<kp-1>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-1-position-1)
													(cadr buyn-monitr-1-position-1))))
(global-set-key (kbd "M-<kp-2>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-1-position-2)
													(cadr buyn-monitr-1-position-2))))
(global-set-key (kbd "M-<kp-3>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-1-position-3)
													(cadr buyn-monitr-1-position-3))))
;; *** MONITOR 2
(global-set-key (kbd "C-M-<kp-7>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-2-position-7)
													(cadr buyn-monitr-2-position-7))))
(global-set-key (kbd "C-M-<kp-9>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-2-position-9)
													(cadr buyn-monitr-2-position-9))))
(global-set-key (kbd "C-M-<kp-8>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-2-position-8)
													(cadr buyn-monitr-2-position-8))))
(global-set-key (kbd "C-M-<kp-4>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-2-position-4)
													(cadr buyn-monitr-2-position-4))))
(global-set-key (kbd "C-M-<kp-5>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-2-position-5)
													(cadr buyn-monitr-2-position-5))))
(global-set-key (kbd "C-M-<kp-6>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-2-position-6)
													(cadr buyn-monitr-2-position-6))))
(global-set-key (kbd "C-M-<kp-1>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-2-position-1)
													(cadr buyn-monitr-2-position-1))))
(global-set-key (kbd "C-M-<kp-2>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-2-position-2)
													(cadr buyn-monitr-2-position-2))))
(global-set-key (kbd "C-M-<kp-3>") '(lambda() (interactive)
			(set-frame-position (selected-frame)
													(car buyn-monitr-2-position-3)
													(cadr buyn-monitr-2-position-3))))
;; ** FRAME SIZE CONTROL KEYS
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
(setq org-indirect-buffer-display `new-frame)
(global-set-key (kbd " M-g M-t M-o") 'org-tree-to-indirect-buffer)
;; (define-key evil-normal-state-map (kbd "gbb") '(lambda() (interactive)
			;; (display-buffer (last-buffer))))
(define-key evil-normal-state-map "ZN" '(lambda() (interactive)
			(make-frame-command)
			(switch-to-buffer-other-frame "*scratch*")
			(evil-buffer-new 0 "*new*")))
(global-set-key (kbd " M-g M-t M-j") '(lambda() (interactive)
			(let (buffer-name-to-close (buffer-name))
			(evil-quit)
			(switch-to-buffer-other-frame buffer-name-to-close))))
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
(global-set-key (kbd " M-g M-t M-z M-x") '(lambda() (interactive)
					(kill-buffer (current-buffer))
					(evil-quit)))
(define-key evil-normal-state-map "ZD" '(lambda() (interactive)
					(kill-buffer (current-buffer))
					))
;; ** Buffer control  {{{
(define-key evil-normal-state-map "ZI" '(lambda() (interactive)
					(ivy-switch-buffer)))
(define-key evil-normal-state-map "ZH" '(lambda() (interactive)
					;; (previous-buffer)))
					(evil-prev-buffer)))
(define-key evil-normal-state-map "ZL" '(lambda() (interactive)
					(evil-next-buffer)))
(define-key evil-normal-state-map "ZF" 'find-file-other-frame)
(define-key evil-normal-state-map "ZK" '(lambda() (interactive)
					(unbury-buffer)))
(define-key evil-normal-state-map "ZJ" '(lambda() (interactive)
					(bury-buffer)))
(define-key evil-normal-state-map "Zn" '(lambda() (interactive)
					(evil-buffer-new 0 "*new*")))
;; --------------------------------------
;; * FULLSCREEN-MOD CUSTOMIZATION;  {{{
;; (find-file-other-frame "~/INI/fullscreen-cfg.el")
(load "~/INI/fullscreen-cfg.el")
;; --------------------------------------
; }}}
;; --------------------------------------
;; * FRAMES-FUN CUSTOMIZATION  
(defun buyn-get-frame-by-name (fname)
  "If there is a frame named FNAME, return it, else nil."
  (require 'dash) ; For `-some'
  (-some (lambda (frame)
           (when (equal fname (frame-parameter frame 'name))
             frame))
         (frame-list)))
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

;; *  --------------------------------------
