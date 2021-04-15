;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/lit-cfg.el")
;; (find-file-other-frame "~/INI/lit-cfg.el") 
;; --------------------------------------
;; *  --------------------------------------
;; * TRANSLATE-MOD CUSTOMIZATION 
;; *** ob-translate
;; **** use-package ob-translate 

(use-package popup :ensure t)
(use-package ob-translate :ensure t
;; (package-refresh-contents)
  ;; :init
  :config
  (add-to-list 'org-babel-load-languages '(translate . t))
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
  ;; add translate special block into structure template alist.
  ;; (add-to-list 'org-structure-template-alist '("t" . "src translate"))
  ;; (add-to-list 'org-structure-template-alist '("tr" . "src translate :dest ru"))
	(add-to-list 'org-structure-template-alist '("t" "#+BEGIN_SRC translate ? \n\n#+END_SRC\n"))
	(add-to-list 'org-structure-template-alist '("tr" "#+BEGIN_SRC translate :dest ru ? \n\n#+END_SRC\n"))
  )
;; **** Docs
;; ***** Options
;; Each block supports the following arguments:
;; Argument	Description	Example	Default
;; :src	Source language.
;; #+BEGIN_SRC translate :src de	‘auto’ (for auto detection).
;; :dest	Destination language(s).
;; #+BEGIN_SRC translate :dest it,fr	‘en’ (for English).
;; :dest may be a single country-code, or a comma-separated list.
;; All defaults are customizable with M-x customize-group RET ob-translate.
;; :dest may be a single country-code, or a comma-separated list.

;; All defaults are customizable with M-x customize-group RET ob-translate.
;; *** google-translate
;; **** use-package google-translate
(use-package google-translate :ensure t
  :custom
  (google-translate-backend-method 'emacs)
  :config
   (defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130)))
;; **** Docs

;; **** --------------------------------------
;; *** go-translate
;; **** use-package go-translate
(use-package go-translate :ensure t
  ;; :init
  :config
	(setq go-translate-local-language "ru")
	(setq go-translate-target-language "en")
	(defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))
  )
;; **** Docs
;; **** --------------------------------------
;; *  --------------------------------------
