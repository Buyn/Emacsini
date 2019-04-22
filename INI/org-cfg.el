;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; ORG-MODE CUSTOMIZATION
;; --------------------------------------
(global-set-key [(control f1)] (lambda () (interactive) (find-file-other-frame "~/ORG/start.org")))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(setq org-enforce-todo-dependencies t)
;; Should unfinished children block state changes in the parent? 
(setq org-enforce-todo-checkbox-dependencies t)
;; Should unfinished checkboxes block state changes in the parent?
(setq org-use-property-inheritance t)
;; DEADLINE является одним из этих свойств, которые по умолчанию не наследуются. Вы можете изменить это, настроив переменную
(load "~/INI/org_agend_cfg.el")

