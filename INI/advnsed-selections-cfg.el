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
  (defhydra hydra-expand-region
	;; (:color blue)
	(:body-pre 'er/expand-region)
  "expand-region"
;; ***** key list
  ("C-=" er/expand-region "more")
  ("=" er/expand-region "more")
  ("m" er/expand-region "more")
  ("-" er/contract-region "less")
  ("l" er/contract-region "less")
  ("C--" er/contract-region "less")
  ("w" er/mark-word "wrd")
  ("s" er/mark-symbol "smbl")
  ;; ("=" er/mark-symbol-with-prefix "more")
  ;; ("=" er/mark-next-accessor "more")
  ("f" er/mark-method-call "methd")
  ("'" er/mark-inside-quotes "iq")
  ("\"" er/mark-outside-quotes "oq")
  ("(" er/mark-inside-pairs "i(")
  (")" er/mark-outside-pairs "o)")
  (";" er/mark-comment ";")
  ("u" er/mark-url "url")
  ;; ("=" er/mark-email "more")
  ("d" er/mark-defun "def")
;; ***** END )
  )
;; **** Bind
(global-set-key (kbd "C-=") 'hydra-expand-region/body)
(define-key evil-normal-state-map "zv" 'hydra-expand-region/body)
;; *** binds
;; (global-set-key (kbd "C-=") 'er/expand-region)
;; ** END of use-package outshine 
	)
;; -------------------------------------- }}}
