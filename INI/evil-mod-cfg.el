;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; EVIL-MOD CUSTOMIZATION
;; --------------------------------------
(require 'evil)
(evil-mode t)
;; --------------------------------------
;; (setq evil-mode-line-format nil
;;       evil-insert-state-cursor '(bar "White")
;;       evil-visual-state-cursor '(box "#F86155"))
;; --------------------------------------
;; (define-key key-translation-map (kbd "ch") (kbd "C-h"))
;; (define-key evil-normal-state-map "c" nil)
;; (define-key evil-motion-state-map "cu" 'universal-argument)
;; --------------------------------------
;; Movements
(define-key evil-normal-state-map "gl" 'move-end-of-line)
(define-key evil-normal-state-map "gh" 'move-beginning-of-line)
(define-key evil-normal-state-map (kbd "gj") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "gk") 'evil-previous-visual-line)
;; --------------------------------------
;; Grabing
(define-key evil-normal-state-map (kbd "M-m M-k") 'move-line-up)
(define-key evil-normal-state-map (kbd "M-m M-j") 'move-line-down)
;; --------------------------------------
;; *** Frams Controls ***
(define-key evil-normal-state-map (kbd "M-g M-t M-t") 'make-frame-command)
;; (define-key evil-normal-state-map "gtt" 'make-frame-command)
(define-key evil-normal-state-map (kbd " M-g M-t M-f") 'find-file-other-frame)
(define-key evil-normal-state-map (kbd " M-g M-t M-b") 'switch-to-buffer-other-frame)
(define-key evil-normal-state-map (kbd " M-g M-t M-d") 'ido-dired-other-frame)
(define-key evil-normal-state-map (kbd "gbb") '(lambda() (interactive)
			(display-buffer (last-buffer))))
;; --------------------------------------
;;   ***   Help in New Frame   ***
;; (define-key evil-normal-state-map (kbd " M-g M-t M-j") 'other-frame)
;; (define-key evil-normal-state-map (kbd " M-g M-t M-k") 'previous-multiframe-window)
;; ;;(define-key evil-normal-state-map "gth" 'other-frame -2)
;;(define-key evil-normal-state-map "gtl" 'other-frame 2)
(define-key evil-normal-state-map (kbd " M-g M-t M-h M-l") 'find-function-on-key-other-frame)
(define-key evil-normal-state-map (kbd " M-g M-t M-h M-k") 'find-function-on-key-other-frame)
(define-key evil-normal-state-map (kbd " M-g M-t M-h M-f") 'describe-function)
(define-key evil-normal-state-map (kbd " M-g M-t M-h M-a") 'xref-find-definitions-other-frame)
;; --------------------------------------
;; ORIGAMI-MOD CUSTOMIZATION
(require 'origami)
(load "~/INI/origami_cfg.el")
;; --------------------------------------
;; Frams Close
(define-key evil-normal-state-map "ZX" '(lambda() (interactive)
					(kill-this-buffer)
					(evil-quit)))

;; --------------------------------------
;; EVIL TABS
(global-evil-tabs-mode t)
(evil-ex-define-cmd "tabc[lone]" 'elscreen-clone)
(evil-ex-define-cmd "tabcl[ose]" 'elscreen-kill)
(elscreen-toggle-display-tab)
;; TODO set display off
;; :tabnew
;; :tabclone
;; --------------------------------------
;; ONE CHAR ADD
(load "~/ELs/Evil/onecharadd.el")
(define-key evil-normal-state-map (kbd "SPC") 'addone-char-into-normal-evil)
(define-key evil-normal-state-map (kbd "RET") 'addone-char-after-normal-evil)
;; --------------------------------------

