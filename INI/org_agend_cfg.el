;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/org-cfg.el")
;; --------------------------------------
;; --------------------- 
;; * ageda setings 
;; --------------------- 
(setq org-agenda-sticky 1)
(setq org-agenda-files '(	
	"~/../Dropbox/orgs/GTD/todo_today.org"
	"~/../Dropbox/orgs/GTD/todo_nottoday.org"))
;; --------------------- 
;; * 
;; --------------------- 
;; (define-key org-agenda-mode-map (kbd "H")
;; 	'(lambda () (interactive) 
;; 		(setq current-prefix-arg '(4)) ; C-u
;; 		(call-interactively 'org-agenda-do-date-earlier)))

(define-key org-agenda-mode-map (kbd "L")
	'(lambda () (interactive) 
		 (org-agenda-date-later-minutes 6)))
(define-key org-agenda-mode-map (kbd "H")
	'(lambda () (interactive) 
		 (org-agenda-date-earlier-minutes 6)))
;; --------------------- 
;; * open ageda on new frame 
;; --------------------- 
;;(setq org-agenda-files (quote ("~/ORG/start.org")))
;;(defun simple-run-command-in-new-frame (command)
;; (select-frame (make-frame))
;; (funcall #'command))

;;(defun run-agenda-in-new-frame ()
;; (run-command-in-new-frame 'org-agenda)
;; (run-command-in-new-frame #'org-agenda)
;;(define-key evil-normal-state-map "gta" 'org-agenda) 
(defun simple-run-command-in-new-frame (command)
  (select-frame (make-frame))
  (funcall #'command))

(define-key evil-normal-state-map (kbd "M-g M-t M-a") '(lambda () (interactive) 
		(simple-run-command-in-new-frame 'org-agenda))) 
;; --------------------- 

;; * Agend ADD new case
;; --------------------- 
;; ** comment : 
 ;; (setq org-agenda-custom-commands 
 ;;      '(("c" "Desk Work" tags-todo "computer" ;; (1) (2) (3) (4)
;; the key to trigger the search ("c")
;; a description of the search for the agenda dispatcher ("Desk Work")
;; the type of search (todo items matching a tag)
;; the tag to search for ("computer")
         ;; ((org-agenda-files '("~/org/widgets.org" "~/org/clients.org")) ;; (5)
         ;;  (org-agenda-sorting-strategy '(priority-up effort-down))) ;; (5) cont.
	 ;;         ("~/computer.html"))
	 ;; specifies that this agenda view should be exported as HTML to "~/computer.html" when the agenda export function is called (C-c a e). 
        ;; ...other commands here
        ;; )))

;; ** org-agenda-custom-commands : 
(setq org-agenda-custom-commands
;; *** Q" . "Custom queries : 
      '(("Q" . "Custom queries") ;; gives label to "Q" 
        ("Qa" "Archive search" search ""
         ((org-agenda-files (file-expand-wildcards "~/archive/*.org")))) 
        ("Qn" "Todo next search" todo "NEXT"
						(
						;; (org-agenda-files (file-expand-wildcards "~/../Dropbox/orgs/GTD/*.org"))
						(org-agenda-files '(		"~/../Dropbox/orgs/GTD/todo_today.org" 
																		;; "~/../Dropbox/orgs/capture/emagus.org" 
																		;; "~/../Dropbox/orgs/capture/Necronomicon.org" 
																		;; "~/../Dropbox/Office/Research/Doc/Grimoire/Grimoire.org"
																		) 
								))) 
        ("QN" todo "NEXT"
						((org-agenda-files '(		"~/../Dropbox/orgs/GTD/todo_today.org" 
																		;; "~/../Dropbox/orgs/capture/emagus.org" 
																		;; "~/../Dropbox/orgs/capture/Necronomicon.org" 
																		;; "~/../Dropbox/Office/Research/Doc/Grimoire/Grimoire.org"
																		) 
						))) 
        ("QH" "My-agenda"
              (	(agenda "")
								(org-agenda-files '(
																						"~/../Dropbox/orgs/capture/emagus.org" 
																						"~/../Dropbox/Office/Research/Doc/Grimoire/Grimoire.org"
																						"~/../Dropbox/orgs/capture/Necronomicon.org" 
																						) 
								))) 
        ("Qh" agenda "My-agenda" (	
								(org-agenda-files '(
																		"~/../Dropbox/orgs/capture/emagus.org" 
																		"~/../Dropbox/orgs/GTD/todo_today.org"
																		"~/../Dropbox/Office/Research/Doc/Grimoire/Grimoire.org"
																		) 
								))) 
        ("Qw" "Website search" search ""
         ((org-agenda-files (file-expand-wildcards "~/website/*.org"))))
        ("Qb" "Projects and Archive" search ""
         ((org-agenda-text-search-extra-files (file-expand-wildcards "~/archive/*.org"))))
                ;; searches both projects and archive directories
        ("QA" "Archive tags search" org-tags-view "" 
         ((org-agenda-files (file-expand-wildcards "~/archive/*.org"))))
        ;; ...other commands here
				)
;; *** ) END org-agenda-custom-commands : 
			)
