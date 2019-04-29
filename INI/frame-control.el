;;
;; Window &amp; Frame Switching with WindMove and FrameMove
;;
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
 
;; Remap windmove keys to home keys
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-l") 'windmove-right)
 
(load "~/.emacs.d/Els/framemove/framemove.el")

(require 'framemove)
    (windmove-default-keybindings)
    (setq framemove-hook-into-windmove t) ;;Hook framemove into windmove keys
;; Common lisp stuff to fix windmove/framemove 
(require 'cl) ;;used to Fix error if theres an error with above code
;;
;; End of Windmove &amp; Framemove setup
;;
