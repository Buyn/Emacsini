;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; VANILA CUSTOMIZATION
;; --------------------------------------
;; Disables the startup message (this is the screen with all the tutorial information)
(setq inhibit-startup-message t) ;; hide the startup message
(tool-bar-mode -1)
;; ------------------------------------------------------
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал
;; ------------------------------------------------------
(load-theme 'material t) ;; load material theme
;;(global-linum-mode t) ;; enable line numbers globally
;;(set-frame-font "Trebuchet MS")
;;(set-frame-font "Ubuntu Mono")
;;(set-default-font "Ubuntu Mono")
(add-to-list 'default-frame-alist
             '(font . "Ubuntu Mono"))
;; ------------------------------------------------------
;; ****** line numbers
;;Unfortunately, Emacs's help message is pretty bad in this case. The menu button is bound to an anonymous function, and the help system is basically displaying the byte-compiled version of that function. I got the Emacs source, searched for the unique looking string "Relative line numbers enabled", and found the function in lisp/menu-bar.el:
;;
;;  (lambda ()
;;    (interactive)
;;    (menu-bar-display-line-numbers-mode 'relative)
;;    (message "Relative line numbers enabled"))

;; (menu-bar-display-line-numbers-mode 'relative)
;; The canonical way to set this is adding display-line-numbers-mode to a mode hook,
;; (add-hook 'foo-mode-hook #'display-line-numbers-mode)
;; or enabling global-display-line-numbers-mode if you want them everywhere,
(global-display-line-numbers-mode 1)
;; and to set display-line-numbers-type to the desired style:
(setq display-line-numbers-type 'relative)
;;Relative line numbers enabled
;; Warp line on visula line end
(global-visual-line-mode word-wrap)
;; ------------------------------------------------------
(show-paren-mode 1)
;; Wrapping selecting text in enclosing characters
;; For parens you can do M-(. For brackets/braces/quotes you could do:
(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-<") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)
;; Also handy for deleting matching whatevers is
(global-set-key (kbd "M-)") 'delete-pair)
(global-set-key (kbd "M-}") 'delete-pair)
(global-set-key (kbd "M-]") 'delete-pair)
(global-set-key (kbd "M->") 'delete-pair)
;; ------------------------------------------------------
