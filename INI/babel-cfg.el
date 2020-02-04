;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/org-cfg.el")
;; --------------------------------------
;; * ORG BABEL CUSTOMIZATION
;; ** BABEL Setup
;; *** set conform
(setq org-confirm-babel-evaluate nil)
;; ** BABEL languages evaluations
;; *** python evaluate
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))
;; *** eshell evaluate
(load "~/ELs/Org/Babel/ob-eshell.el")
;; (use-package ob-eshell :ensure t
  ;; :defer 2
  ;; :bind ("C-c c" hydra-clock/body)
;;  **** END of use-package hydra
  ;; )									 
(org-babel-do-load-languages
 'org-babel-load-languages
 '((eshell . t)))

;; --------------------------------------
