
;; (find-file "~/ELs/folding/folding.el")
;; (load-file "~/ELs/folding/folding.el")

;; (autoload 'folding-mode          "folding" "Folding mode" t)
;; (autoload 'turn-off-folding-mode "folding" "Folding mode" t)
;; (autoload 'turn-on-folding-mode  "folding" "Folding mode" t)

(if (load "folding" 'nomessage 'noerror)
	(folding-mode-add-find-file-hook))

;; (folding-add-to-marks-list
;;            'python-mode "{{{" "}}}" nil t)

;; (fold-mode)
;; {{{


;; }}}
;File layout controlled by Emacs folding.el available at: 
;https://github.com/jaalto/project-emacs--folding-mode.
										;
;; Folding http://www.emacswiki.org/emacs/FoldingMode
;; to enable call M-x folding-mode
(if (load "folding" 'nomessage 'noerror)
	(folding-mode-add-find-file-hook))
;; (folding-add-to-marks-list 'python-mode "{{{" "}}}" nil t) ;example
;;(folding-add-to-marks-list 'ruby-mode "#{{{" "#}}}" nil t) ;example

(define-key evil-normal-state-map "za" 'folding-toggle-show-hide)
(define-key evil-normal-state-map "zR" 'folding-whole-buffer)
(define-key evil-normal-state-map "zM" 'folding-open-buffer)
(define-key evil-normal-state-map "zr" 'folding-hide-current-subtree)
(define-key evil-normal-state-map "zm" 'folding-show-current-subtree)
(define-key evil-normal-state-map "zo" 'folding-show-current-entry)
(define-key evil-normal-state-map "zc" 'folding-hide-current-entry)
(define-key evil-normal-state-map "zj" 'folding-next-visible-heading)
(define-key evil-normal-state-map "zk" 'folding-previous-visible-heading)
;; (define-key evil-normal-state-map "zf" 'folding-fold-region)
(define-key evil-normal-state-map "zf"
  '(lambda ()
	 "create fold, exit from shifting and add comment to it"
	 (interactive)
	 (folding-fold-region (region-beginning) (region-end))
	 (folding-shift-out)
	 (folding-toggle-show-hide)
	 (evil-append-line 1)
	 (insert " FoldingComment")
	 (evil-normal-state)
	 (evil-backward-WORD-begin)
))

(defun bss/folding-not-in-org ()
  "selective folding toggle by tab: skip org-mode"
  (interactive)
  (if (equal major-mode 'org-mode)
 	  (org-cycle)
 	(folding-toggle-show-hide)
	))
(define-key evil-normal-state-map (kbd "<tab>") 'bss/folding-not-in-org)

(add-hook 'python-mode-hook (lambda () (folding-mode)))
