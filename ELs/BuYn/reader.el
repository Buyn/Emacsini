;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file-other-frame "~/INI/lit-cfg.el")
;; * --------------------------------------
;; * BUYN's ELISP DEFUNS
;; --------------------------------------
;; ** varibls

;; --------------------------------------
;; ** functions
;; *** buyn-read-aloud-start :
;; *** buyn-read-aloud-stop :
;; *** buyn-reader-stop :
(defun buyn-reader-stop (cmd-params)
  "	устанавливает пробел на добовление символа
и отключает плавное движение
		"
						(pixel-scroll-mode -1)
						(setq scroll-preserve-screen-position nil)
						(define-key evil-normal-state-map (kbd "SPC") 
									'khaoos-insert-one-char)
						(message "Reader is off"))
;; *** buyn-reader-start :
(defun buyn-reader-start (cmd-params)
  "	ставит пробел на плавноесть движения
и ф8 на на переключени на озвучку голосом
		"
  (shell-command
		(concat "cmd"
						" /c "
						" start "
						cmd-params
						" &"
						)))

;; --------------------------------------
;; *** buyn-reader-go :
(defun buyn-reader-go (cmd-params)
  "	ставит пробел на плавноесть движения
и ф8 на на переключени на озвучку голосом
		"
			(evil-window-middle)
			(next-line 9)
			;; (evil-window-bottom)
			(pixel-scroll-pixel-up 666))

;; --------------------------------------
;; * --------------------------------------
