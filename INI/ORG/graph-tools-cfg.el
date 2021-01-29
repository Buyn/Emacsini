;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/org-cfg.el")
;; --------------------------------------
;; * PLANTUML MODE
;; ** plantuml use-package: 
(use-package plantuml-mode :ensure t
;; *** :init : 
  ;; :init
;; *** :config : 
  :config
	(setq org-plantuml-jar-path 
		(expand-file-name "~/AddApps/plantuml/plantuml.1.2021.0.jar"))
	(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
	(org-babel-do-load-languages 
		'org-babel-load-languages 
		'((plantuml . t)))
;; *** end use-package : 
	)

;; *** --------------------------------------

;; * DITAA MODE
(use-package ob-ditaa 
  ;; :init
  :config
	(setq org-ditaa-jar-path "~/AddApps/ditaa/ditaa0_9.jar")
	(org-babel-do-load-languages
		'org-babel-load-languages
		'((ditaa . t))) ; this line activates ditaa
	)
;;  --------------------------------------

;; * ARTIST MODE
(add-hook 'artist-mode-hook (lambda ()
	;; (local-set-key (kbd "<f1>") 'org-mode)
	(local-set-key (kbd "<f2>") 
		'artist-select-op-pen-line) ; f2 = pen mode
	(local-set-key (kbd "<f3>") 
		'artist-select-op-line)     ; f3 = line
	(local-set-key (kbd "<f4>") 
		'artist-select-op-square) ; f4 = rectangle
	(local-set-key (kbd "<f5>") 
		'artist-select-op-ellipse)  ; f5 = ellipse
	(local-set-key (kbd "<f6>") 
		'artist-select-op-erase-rectangle)  ; f6 = erase
	(local-set-key (kbd "<f7>") 
		'artist-select-op-spray-can)  ; f7 = spray
	;; (local-set-key (kbd "C-z") 'undo)
	))
;; ** --------------------------------------

;; * --------------------------------------
