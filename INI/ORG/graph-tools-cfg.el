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

;; ** --------------------------------------

;; * --------------------------------------
