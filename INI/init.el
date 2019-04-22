;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; INSTALL PACKAGES
;; --------------------------------------
(load "~/INI/inpak.el")
;; --------------------------------------
;; VANILA CUSTOMIZATION
;; --------------------------------------
(load "~/INI/vanila_cfg.el")
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
