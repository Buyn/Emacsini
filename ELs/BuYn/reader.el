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
(defun buyn-reader-start (cmd-params)
  "	Старт озвучки с курсора и установка пробела на стоп команду
		и установка ф8 на активацию читалки
		"
			(read-aloud-buf)
			(define-key evil-normal-state-map (kbd "SPC")
				'buyn-read-aloud-stop
			(define-key evil-normal-state-map (kbd "F8")
				'buyn-reader-start
			(message "read-aloud is start"))))

;; *** buyn-read-aloud-go :
(defun buyn-read-aloud-go (cmd-params)
  "	Старт озвучки с курсора и установка пробела на стоп команду
		"
			(read-aloud-buf)
			(define-key evil-normal-state-map (kbd "SPC")
				'buyn-read-aloud-stop))

;; *** buyn-read-aloud-stop :
(defun buyn-read-aloud-stop (cmd-params)
  "	Стop озвучки и установка пробела на старт озвучки
		"
			(read-aloud-stop)
			(define-key evil-normal-state-map (kbd "SPC")
				'buyn-read-aloud-go))

;; *** buyn-reader-end :
(defun buyn-reader-end (cmd-params)
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
	(pixel-scroll-mode 1)
	(setq scroll-preserve-screen-position 1)
	(setq pixel-wait 0.1)
	(define-key evil-normal-state-map (kbd "SPC") 
		'buyn-reader-go)
	(define-key evil-normal-state-map (kbd "F8") 
		'buyn-read-aloud-start))

;; --------------------------------------
;; *** buyn-reader-stop :
;; Ненаписано но
;; былобы не плоха устанвливать на пробел
;; команду контал джи
;; но понятия не имею как её передать  
;; негде не встретил 

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
