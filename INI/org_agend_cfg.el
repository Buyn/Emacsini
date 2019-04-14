;; --------------------- 
;; open ageda on new frame 
;; --------------------- 
;;(setq org-agenda-files (quote ("~/ORG/start.org")))
;;(defun simple-run-command-in-new-frame (command)
;; (select-frame (make-frame))
;; (funcall #'command))

;;(defun run-agenda-in-new-frame ()
;; (run-command-in-new-frame 'org-agenda)
;; (run-command-in-new-frame #'org-agenda)
;;(define-key evil-normal-state-map "gta" 'org-agenda) 
(define-key evil-normal-state-map "gta" (lambda () (interactive) (simple-run-command-in-new-frame 'org-agenda))) 

;; --------------------- 
;; Agend ADD new case
;; --------------------- 
(custom-set-variables
 (setq org-agenda-custom-commands 
      '(("c" "Desk Work" tags-todo "computer" ;; (1) (2) (3) (4)
;; the key to trigger the search ("c")
;; a description of the search for the agenda dispatcher ("Desk Work")
;; the type of search (todo items matching a tag)
;; the tag to search for ("computer")

         ((org-agenda-files '("~/org/widgets.org" "~/org/clients.org")) ;; (5)
          (org-agenda-sorting-strategy '(priority-up effort-down))) ;; (5) cont.
	 ;;         ("~/computer.html"))
	 ;; specifies that this agenda view should be exported as HTML to "~/computer.html" when the agenda export function is called (C-c a e). 
        ;; ...other commands here
        ))

(setq org-agenda-custom-commands
      '(("Q" . "Custom queries") ;; gives label to "Q" 
        ("Qa" "Archive search" search ""
         ((org-agenda-files (file-expand-wildcards "~/archive/*.org")))) 
        ("Qw" "Website search" search ""
         ((org-agenda-files (file-expand-wildcards "~/website/*.org"))))
        ("Qb" "Projects and Archive" search ""
         ((org-agenda-text-search-extra-files (file-expand-wildcards "~/archive/*.org"))))
                ;; searches both projects and archive directories
        ("QA" "Archive tags search" org-tags-view "" 
         ((org-agenda-files (file-expand-wildcards "~/archive/*.org"))))
        ;; ...other commands here
         ))
