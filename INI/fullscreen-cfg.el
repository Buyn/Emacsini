;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/frame-control.el")
;; --------------------------------------
;; * MINIMAP-MODE CUSTOMIZATION 
;; --------------------------------------
;; (find-file-other-frame "~/INI/frames/minimap-cfg.el")
(load "~/INI/frames/minimap-cfg.el")
;; --------------------------------------
;; * FULLSCREEN-MOD CUSTOMIZATION
;; --------------------------------------
;; (setq-local fullscreen-mode-activ nil)
(make-variable-buffer-local
 (defvar fullscreen-mode-activ nil
   "indictate is fullscreen mode is activ or nil"))
;; (setq fullscreen-mode-activ nil)
;; ** toggle-full-screen :
(defun toggle-full-screen ()
  "Toggles full-screen mode for Emacs window on Win32."
  (interactive)
  (toggle-frame-fullscreen)
)
;; --------------------------------------
;; ** toggle-fonte-lage-size : 
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
;; --------------------------------------
;; ** toggle-bars : 
(defun toggle-bars ()
  "Toggles bars visibility."
  (interactive)
  (menu-bar-mode)
  (scroll-bar-mode))
;; --------------------------------------
;; ** toggle-full-screen-and-bars : 
(defun toggle-full-screen-and-bars ()
  "Toggles full-screen mode and bars."
  (interactive)
  ;; (toggle-bars)
	(setq-local fullscreen-mode-activ (not fullscreen-mode-activ))
  (toggle-full-screen)
  (toggle-fonte-lage-size)
	(toggle-fullscreen-minimap)
	;; (evil-window-set-width 0)
	)
;; ** defun toggle-fullscreen-minimap : 
;; --------------------------------------
(defun toggle-fullscreen-minimap ()
  "Toggle minimap in fullscreen
		fullscreen is chekt on fullscreen-mode-activ
		"
  (interactive)
	;; (minimap-mode)
	;; (minimap-create)
	(if fullscreen-mode-activ
		;; (minimap-create-window)
		(minimap-mode)
		(minimap-kill))
	;; (minimap-recenter)
	;; (minimap-mode)
	;; (minimap-update nil)
	;; (minimap-update)
	;; (minimap-active-current-buffer-p)
  )
;; ** set-key : 
;; --------------------------------------
;; Use F11 to switch between windowed and full-screen modes
;;(global-set-key (kbd "C-M-f") 'toggle-full-screen-and-bars)
;;(define-key evil-normal-state-map [(control shift f)] 'toggle-full-screen-and-bars)
(global-set-key [(control shift f)]  'toggle-full-screen-and-bars)
;; --------------------------------------
;; ** --------------------------------------
;; * --------------------------------------
