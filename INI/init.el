;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; INSTALL PACKAGES
;; --------------------------------------
(require 'package)
(add-to-list 'package-archives
;;        '("melpa" . "http://melpa.org/packages/") t)
       '("melpa" . "http://melpa.org/packages/") )
(add-to-list 'package-archives 
		 '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives 
		 '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; --------------------------------------
;; Automatically Installing Packages
;; --------------------------------------
;; D:\Development\lisp\doc\Cfg\use-pac.txt

;; --------------------------------------
;; M-x package-refresh-contents
;; before
;; M-x package-install RET evil
;; if you're going to call (package-initialize) yourself.
;;(setq package-enable-at-startup nil)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; --------------------------------------
;; BASIC CUSTOMIZATION
;; --------------------------------------
;; Disables the startup message (this is the screen with all the tutorial information)
(setq inhibit-startup-message t) ;; hide the startup message
(tool-bar-mode -1)
(load-theme 'material t) ;; load material theme
;;(global-linum-mode t) ;; enable line numbers globally
;;(set-frame-font "Trebuchet MS")
;;(set-frame-font "Ubuntu Mono")
;;(set-default-font "Ubuntu Mono")
(add-to-list 'default-frame-alist
             '(font . "Ubuntu Mono"))
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
(show-paren-mode 1)
;; and to set display-line-numbers-type to the desired style:
(setq display-line-numbers-type 'relative)
;;Relative line numbers enabled

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
;;(load "~/INI/org_agend_cfg.el")
;; Frams Close

(defun kill-buffer-and-frame ()
  "kill buffer and cloze frame"
  (interactive)
  (kill-buffer-and-window)
  (kill-this-buffer)
  (evil-quit))
(define-key evil-normal-state-map "ZX" 'kill-buffer-and-frame)

;; --------------------------------------
;; AUTO-COMPLETE  CUSTOMIZATION
;; --------------------------------------
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
;; --------------------------------------
;; FULLSCREEN-MOD CUSTOMIZATION
;; --------------------------------------

(defun toggle-full-screen ()
  "Toggles full-screen mode for Emacs window on Win32."
  (interactive)
  (toggle-frame-fullscreen)
)
(defun toggle-fonte-lage-size ()
  "Toggle betwin fullscrin font size and normal"
  (interactive)
  ;; use a property “state”. Value is t or nil
  (if (get 'toggle-font-lage-size 'state)
      (progn
	(text-scale-set 0)
        (put 'toggle-font-lage-size 'state nil))
    (progn
	(text-scale-set +3)
	(put 'toggle-font-lage-size 'state t))))


(defun toggle-bars ()
  "Toggles bars visibility."
  (interactive)
  (menu-bar-mode)
  (scroll-bar-mode))

(defun toggle-full-screen-and-bars ()
  "Toggles full-screen mode and bars."
  (interactive)
  (toggle-bars)
  (toggle-fonte-lage-size)
  (toggle-full-screen))

;; Use F11 to switch between windowed and full-screen modes
;;(global-set-key (kbd "C-M-f") 'toggle-full-screen-and-bars)
;;(define-key evil-normal-state-map [(control shift f)] 'toggle-full-screen-and-bars)
(global-set-key [(control shift f)]  'toggle-full-screen-and-bars)
(global-set-key [(control f1)] (lambda () (interactive) (find-file-other-frame "~/ORG/start.org")))

;; --------------------------------------
;; ORG-MODE CUSTOMIZATION
;; --------------------------------------
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(setq org-enforce-todo-dependencies t)
;; Should unfinished children block state changes in the parent? 
(setq org-enforce-todo-checkbox-dependencies t)
;; Should unfinished checkboxes block state changes in the parent?
(setq org-use-property-inheritance t)
;; DEADLINE является одним из этих свойств, которые по умолчанию не наследуются. Вы можете изменить это, настроив переменную
(load "~/INI/org_agend_cfg.el")

;; --------------------------------------
;; init.el ends here
