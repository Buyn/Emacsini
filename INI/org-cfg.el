;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/init.el")
;; --------------------------------------
;; --------------------------------------
;; * ORG-MODE CUSTOMIZATION
;; --------------------------------------
;; ** ---------------     ORG setup
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        ;; (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "NEXT(x)" "WAITING(w)" "VERIFY(v)" "|" "CANCELED(c)" "DELEGATED(g)")))
;; (setq org-agenda-custom-commands
;;       '(("n" occur-tree "NEXT")))
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
;; --------------------------------------
;; ** ---------------     ORG TODOs
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        ;; (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "NEXT(x)" "WAITING(w)" "VERIFY(v)" "|" "CANCELED(c)" "DELEGATED(g)")))
;; (setq org-agenda-custom-commands
;;       '(("n" occur-tree "NEXT")))
;; --------------------------------------
;; ** ---------------     ORG Capures
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
;; ** --------------     Defult Propertys
;; --------------------------------------
(setq org-enforce-todo-dependencies t)
;; Should unfinished children block state changes in the parent? 
(setq org-enforce-todo-checkbox-dependencies t)
;; Should unfinished checkboxes block state changes in the parent?
(setq org-use-property-inheritance t)
;; DEADLINE является одним из этих свойств, которые по умолчанию не наследуются. Вы можете изменить это, настроив переменную
;; User Option: org-confirm-shell-link-function
;;     Function that prompts the user before executing a shell link. 
(setq org-confirm-shell-link-function nil)
;; User Option: org-confirm-elisp-link-function
;;     Function that prompts the user before executing an Emacs Lisp link. 
(setq org-confirm-elisp-link-function nil)
;; ** ---------------     ORG Foldings
;; *** foldings on lavel navigations
(define-key evil-normal-state-map "zj" 'org-forward-element)
(define-key evil-normal-state-map "zk" 'org-backward-element)
(define-key evil-normal-state-map "zh" 'org-up-element)
(define-key evil-normal-state-map "zl" 'org-down-element)
;; *** z[
(define-key evil-normal-state-map "z[" '(lambda() (interactive)
					(outline-up-heading 3)
					))
;; *** z]
(define-key evil-normal-state-map "z]" '(lambda() (interactive)
					(show-branches)
					(dotimes (i 3)
						(org-down-element)
						)))
;; *** zc
(define-key evil-normal-state-map "zc" '(lambda() (interactive)
					(outline-previous-visible-heading 1)
					(hide-subtree)
					))
;; *** zC
(define-key evil-normal-state-map "zC" '(lambda() (interactive)
					(outline-up-heading 3)
					(hide-subtree)
					))
;; (define-key evil-normal-state-map "z]" 'origami-previous-fold)
;; ** ORG agenda customization
(load "~/INI/org_agend_cfg.el")
;; ** ORG babel 
(load "~/INI/babel-cfg.el")

;; --------------------------------------
