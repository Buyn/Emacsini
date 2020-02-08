;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/init.el")
;; --------------------------------------
;; * LITERARY-MOD CUSTOMIZATION 
;; --------------------------------------
;; ** TRANSLATE-MOD CUSTOMIZATION 
;; ** ob-translate
;; **** use-package outshine 
(use-package ob-translate :ensure t
;; (package-refresh-contents)
;; M-x package-refresh-contents
;; M-x package-install RET ob-translate
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
