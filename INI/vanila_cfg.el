;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; VANILA CUSTOMIZATION
;; --------------------------------------
;; Disables the startup message (this is the screen with all the tutorial information)
(setq inhibit-startup-message t) ;; hide the startup message
(tool-bar-mode -1)
;; (menu-bar-mode -1)
;; ------------------------------------------------------
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал
;; ------------------------------------------------------
(add-to-list 'default-frame-alist '(height . 35))
(add-to-list 'default-frame-alist '(width . 75))
;; ------------------------------------------------------
(load-theme 'material t) ;; load material theme
;;(global-linum-mode t) ;; enable line numbers globally
;;(set-frame-font "Trebuchet MS")
;;(set-frame-font "Ubuntu Mono")
;;(set-default-font "Ubuntu Mono")
(add-to-list 'default-frame-alist
             '(font . "Ubuntu Mono"))
(setq-default tab-width 4)
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
(show-paren-mode 1)
;; for working with pair-able characters
;; lightweight package electric, which provided by Emacs out of the box.
(electric-pair-mode 1)
;; It supports, by default, ACSI pairs {}, [], () and Unicode ‘’, “”,
;; Let's add the org-emphasises markers.
;; (setq electric-pair-pairs
;;       '(
;;         (?~ . ?~)
;;         (?* . ?*)
;;         (?/ . ?/)
;;        ))
;; ------------------------------------------------------
;; “Interactively Do Things” (a.k.a. ido)
(require 'ido)
(ido-mode t)
;; ------------------------------------------------------
;; change input method
(set-input-method "russian-computer")
(global-set-key (kbd "C-^") 'toggle-input-method)
;; ------------------------------------------------------
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
;; Backups
;; By default, Emacs saves backup files – those ending in ~ – in the current directory, thereby cluttering it up.
;; Let's place them in ~/.emacs.d/backups, in case we need to look for a backup; moreover, let's keep old versions since there's disk space to go around
;;–what am I going to do with 500gigs when nearly all my ‘software’ is textfiles interpreted within Emacs 
;; New location for backups.
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
;; Never silently delete old backups.
;; (setq delete-old-versions -1)
;; Use version numbers for backup files.
(setq version-control t)
;; Even version controlled files get to be backed up.
;; (setq vc-make-backup-files t)

