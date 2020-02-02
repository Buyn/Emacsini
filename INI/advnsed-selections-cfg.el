;; --------------------------------------
;; init.el --- Emacs configuration
;; * used in
;; (find-file "~/INI/init.el")
;; --------------------------------------
;; * ADVNSED SELECTIONS CUSTOMIZATION
;; --------------------------------------
;; ** use-package expand-region 
(use-package expand-region :ensure t
;; ** expand-region config
  :config
;; *** hydra-expand-region
;; **** defhydra
(defhydra hydra-expand-region (:color blue)
  "expand-region"
  ("C-=" er/expand-region "more")
  ("=" er/expand-region "more")
  ;; ("-" text-scale-decrease "less")
  ;; ("C--" er/expand-region "less")
  ("w" er/mark-word "wrd")
  ("s" er/mark-symbol "smbl")
  ;; ("=" er/mark-symbol-with-prefix "more")
  ;; ("=" er/mark-next-accessor "more")
  ("m" er/mark-method-call "methd")
  ("'" er/mark-inside-quotes "iq")
  ("\"" er/mark-outside-quotes "oq")
  ("(" er/mark-inside-pairs "i(")
  (")" er/mark-outside-pairs "o)")
  (";" er/mark-comment ";")
  ("u" er/mark-url "url")
  ;; ("=" er/mark-email "more")
  ("d" er/mark-defun "def")
  )
;; **** Bind
(global-set-key (kbd "C-=") 'hydra-expand-region/body)
(define-key evil-normal-state-map "zv" 'hydra-expand-region/body)
;; *** binds
;; (global-set-key (kbd "C-=") 'er/expand-region)
;; ** END of use-package outshine 
	)
;; -------------------------------------- }}}
