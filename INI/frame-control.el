;;
;; Window &amp; Frame Switching with WindMove and FrameMove
;;
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;; --------------------------------------
;; Remap windmove keys to home keys
(global-set-key (kbd "M-h") nil)
(global-set-key (kbd "M-h") 'windmove-left)
(define-key org-mode-map (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-j") nil)
(global-set-key (kbd "M-j") 'windmove-down)
(define-key org-mode-map (kbd "M-j") 'windmove-down)
(define-key c-mode-base-map (kbd "M-j") 'windmove-down)
(define-key c++-mode-map  (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") nil)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-l") nil)
(global-set-key (kbd "M-l") 'windmove-right)
;; --------------------------------------
(global-set-key (kbd "M-<kp-7>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 0 0)))
(global-set-key (kbd "M-<kp-9>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 1280 0)))
(global-set-key (kbd "M-<kp-8>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 640 0)))
(global-set-key (kbd "M-<kp-4>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 0 180)))
(global-set-key (kbd "M-<kp-5>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 640 180)))
(global-set-key (kbd "M-<kp-6>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 1280 180)))
(global-set-key (kbd "M-<kp-1>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 0 360)))
(global-set-key (kbd "M-<kp-2>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 640 360)))
(global-set-key (kbd "M-<kp-3>") '(lambda() (interactive)
				  (set-frame-position (selected-frame) 1280 360)))
(global-set-key (kbd "M-<kp-subtract>") '(lambda() (interactive)
				(set-frame-size (selected-frame) 75 25)))
(global-set-key (kbd "C-M-<kp-subtract>") '(lambda() (interactive)
				(set-frame-size (selected-frame) 75 35)))
;; (global-set-key (kbd "<kp-subtract>") 'xah-close-current-buffer)
;; (global-set-key (kbd "<kp-divide>") 'xah-previous-user-buffer)
;; (global-set-key (kbd "<kp-multiply>") 'xah-next-user-buffer)
;; (global-set-key (kbd "<kp-decimal>") 'other-window)
;; (global-set-key (kbd "<C-kp-divide>") 'xah-previous-emacs-buffer)
;; (global-set-key (kbd "<C-kp-multiply>") 'xah-next-emacs-buffer)


;; --------------------------------------
(load "~/.emacs.d/Els/framemove/framemove.el")
(require 'framemove)
    (windmove-default-keybindings)
    (setq framemove-hook-into-windmove t) ;;Hook framemove into windmove keys
;; Common lisp stuff to fix windmove/framemove 
(require 'cl) ;;used to Fix error if theres an error with above code
;;
;; End of Windmove &amp; Framemove setup
;;
