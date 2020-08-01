;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/frame-control.el")
;; --------------------------------------
;; * FULLSCREEN-MOD CUSTOMIZATION
;; --------------------------------------
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
  (toggle-fonte-lage-size)
  (toggle-full-screen))
;; --------------------------------------
;; ** set-key : 
;; --------------------------------------
;; Use F11 to switch between windowed and full-screen modes
;;(global-set-key (kbd "C-M-f") 'toggle-full-screen-and-bars)
;;(define-key evil-normal-state-map [(control shift f)] 'toggle-full-screen-and-bars)
(global-set-key [(control shift f)]  'toggle-full-screen-and-bars)
;; --------------------------------------
;; * --------------------------------------
