
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
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
 
(require 'framemove)
    (windmove-default-keybindings)
    (setq framemove-hook-into-windmove t) ;;Hook framemove into windmove keys
;; Common lisp stuff to fix windmove/framemove 
(require 'cl) ;;used to Fix error if theres an error with above code
;;
;; End of Windmove &amp; Framemove setup
;;
