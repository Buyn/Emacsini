;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; EVIL-MOD CUSTOMIZATION
;; --------------------------------------
(require 'evil)
(evil-mode t)
;; (define-key key-translation-map (kbd "ch") (kbd "C-h"))
;; (define-key evil-normal-state-map "c" nil)
;; (define-key evil-motion-state-map "cu" 'universal-argument)
;; Movements
(define-key evil-normal-state-map "gl" 'move-end-of-line)
(define-key evil-normal-state-map "gh" 'move-beginning-of-line)
;;Frams Controls
(define-key evil-normal-state-map "gtt" 'make-frame-command)
(define-key evil-normal-state-map "gtf" 'find-file-other-frame)
(define-key evil-normal-state-map "gtb" 'switch-to-buffer-other-frame)
(define-key evil-normal-state-map "gtj" 'other-frame)
(define-key evil-normal-state-map "gtk" 'previous-multiframe-window)
;;(define-key evil-normal-state-map "gth" 'other-frame -2)
;;(define-key evil-normal-state-map "gtl" 'other-frame 2)
(define-key evil-normal-state-map "gthk" 'describe-key)
(define-key evil-normal-state-map "gthf" 'describe-function)
;; Frams Close

(defun kill-buffer-and-frame ()
  "kill buffer and cloze frame"
  (interactive)
  (kill-buffer-and-window)
  (kill-this-buffer)
  (evil-quit))
(define-key evil-normal-state-map "ZX" 'kill-buffer-and-frame)

