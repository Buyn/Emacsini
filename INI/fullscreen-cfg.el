;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/frame-control.el")
;; --------------------------------------
;; * MINIMAP-MODE CUSTOMIZATION
;; --------------------------------------
;; ** use-package evil
;; (use-package minimap
;; 							:ensure t
;; ** :config : 
	;; :config
	;; (minimap-mode)
	;; (setq minimap-recreate-windo nil)
	;; (setq minimap-major-modes nil)
	;; (setq minimap-major-modes '(prog-mode))
;; ** END of use-package minimap-mode
  ;; )
;; ** Docs
;; After installation, simply use M-x minimap-mode to toggle activation of the minimap.
;; Use 'M-x customize-group RET minimap RET' to adapt minimap to your needs.
;; --------------------------------------
;; ** --------------------------------------
;; * FULLSCREEN-MOD CUSTOMIZATION
;; --------------------------------------
;; (setq-local fullscreen-mode-activ nil)
(setq fullscreen-mode-activ nil)
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
	;; (setq-local fullscreen-mode-activ (not fullscreen-mode-activ))
  (toggle-full-screen)
  (toggle-fonte-lage-size)
	;; (toggle-fullscreen-minimap)
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
		(minimap-create-window)
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
