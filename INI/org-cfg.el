;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; ORG-MODE CUSTOMIZATION
;; --------------------------------------
(require 'org)
(global-set-key [(control f1)] (lambda () (interactive) (find-file-other-frame "~/ORG/start.org")))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(setq org-log-done t)
;; (global-set-key (kbd "C-c l") 'org-store-link)
;; (global-set-key (kbd "C-c a") 'org-agenda)
;; (define-key org-mode-map (kbd "M-\~") 'insert-pair)
;; ---------------     ORG Capures
;; --------------------------------------
(global-set-key (kbd "C-c c") 'org-capture)
;; (setq org-default-notes-file (concat org-directory "~/org/notes.org"))
(setq org-capture-templates '(
	("t" "Todo" entry
	    (file+headline "~/org/gtd/gtd.org" "Tasks")
	    "* TODO %?\n  %i\n  %a")
	("i" "Todo [inbox]" entry
	    (file+headline "~/org/gtd/inbox.org" "Tasks")
	    "* TODO %i%?")
	("T" "Tickler" entry
	    (file+headline "~/org/gtd/tickler.org" "Tickler")
	    "* %i%? \n %U")
	("j" "Journal" entry
	    (file+datetree "~/org/journal.org")
	    "* %?\nEntered on %U\n  %i\n  %a")))
(setq org-refile-targets '(("~/org/gtd/gtd.org" :maxlevel . 3)
                           ("~/org/gtd/someday.org" :level . 1)
                           ("d:/My_Docs/Ofice/PaperFlow/TODO/weekly.org" :level . 1)
                           ("d:/My_Docs/Ofice/PaperFlow/TODO/monthly.org" :level . 1)
                           ("d:/My_Docs/Ofice/PaperFlow/TODO/GTD.org" :level . 1)
                           ("~/org/gtd/tickler.org" :maxlevel . 2)))
;; To define special keys to capture to a particular template without going through the interactive template selection, you can create your key binding like this:
;; (define-key global-map "\C-cx"
;;   (lambda () (interactive) (org-capture nil "x")))
;; https://orgmode.org/manual/Capture-templates.html#Capture-templates
;; --------------     Defult Propertys
;; --------------------------------------
(setq org-enforce-todo-dependencies t)
;; Should unfinished children block state changes in the parent? 
(setq org-enforce-todo-checkbox-dependencies t)
;; Should unfinished checkboxes block state changes in the parent?
(setq org-use-property-inheritance t)
;; DEADLINE является одним из этих свойств, которые по умолчанию не наследуются. Вы можете изменить это, настроив переменную
(load "~/INI/org_agend_cfg.el")

