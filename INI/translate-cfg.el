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
(use-package ob-translate :ensure t
;; (package-refresh-contents)
  :init
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
;; *  --------------------------------------
