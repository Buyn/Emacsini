;; --------------------------------------
;; init.el --- Emacs configuration
;; not used - commented in
;; (find-file "~/INI/folding-cfg.el")
;; --------------------------------------
;; --------------------------------------
;; ORIGAMI-MOD CUSTOMIZATION
;; --------------------------------------
(require 'origami)
(global-origami-mode 1)
(load-file "~/INI/origami_triplebrase.el")
(defun nin-origami-toggle-node ()
  (interactive)
  (if (equal major-mode 'org-mode)
	  (org-cycle)
	(save-excursion ;; leave point where it is
	  (goto-char (point-at-eol))             ;; then go to the end of line
	  (origami-toggle-node (current-buffer) (point)))))                 ;; and try to fold

(add-hook 'prog-mode-hook
		  (lambda ()
			(setq-local origami-fold-style 'triple-braces)
			(origami-mode)
			(origami-close-all-nodes (current-buffer))))
(evil-define-key 'normal prog-mode-map (kbd "TAB") 'nin-origami-toggle-node)

(define-key evil-normal-state-map "za" 'triple-braces-forward-togle)
;; (define-key evil-normal-state-map "za" 'origami-forward-toggle-node)
(define-key evil-normal-state-map "zR" 'origami-close-all-nodes)
;; (define-key evil-normal-state-map "zM" 'origami-open-all-nodes)
(define-key evil-normal-state-map "zr" 'origami-close-node-recursively)
;; (define-key evil-normal-state-map "zm" 'origami-open-node-recursively)
(define-key evil-normal-state-map "zo" 'origami-show-node)
(define-key evil-normal-state-map "zc" 'origami-close-node)
(define-key evil-normal-state-map "zj" 'origami-forward-fold)
(define-key evil-normal-state-map "zk" 'origami-previous-fold)
(define-key evil-visual-state-map "zf"
  'triple-braces-create-and-comment-on-rigion)
;;   '(lambda ()
;; 	 "create fold and add comment to it"
;; 	 (interactive)
;; 	 (setq start (region-beginning))
;; 	 (setq end (region-end))
;; 	 (deactivate-mark)
;; 	 (and (< end start)
;; 		  (setq start (prog1 end (setq end start))))
;; 	 (goto-char start)
;; 	 (beginning-of-line)
;; 	 (indent-according-to-mode)
;; 	 (insert comment-start)
;; 	 (setq start (point))
;; 	 (insert " " " {{{")
	 ;; (newline-and-indent)
	 ;; (goto-char end)
	 ;; (end-of-line)
	 ;; (and (not (bolp))
	 ;; 	  (eq 0 (forward-line))
	 ;; 	  (eobp)
	 ;; 	  (insert ?\n))
	 ;; (indent-according-to-mode)
	 ;; (if (equal comment-end "")
	 ;; 	 (insert comment-start " ;; ;; }}}")
;; 	   (insert comment-end "}}}"))
;; 	 (newline-and-indent)
;; 	 (goto-char start)
;; 	 ))
(define-key evil-normal-state-map "zf" 
  'triple-braces-create-and-comment-on-line-end)
  ;; '(lambda ()
  ;; 	 "create fold and add comment to it"
  ;; 	 (interactive)
  ;; 	 (end-of-line) 
  ;; 	 (insert comment-start)
  ;; 	 ;; (indent-according-to-mode)
  ;; 	 (setq start (point))
  ;; 	 (insert " " " {{{")
  ;; 	 (newline-and-indent)
  ;; 	 (indent-according-to-mode)
  ;; 	 (if (equal comment-end "")
  ;; 		 (insert comment-start " }}}")
  ;; 	   (insert comment-end "}}}"))
  ;; 	 (goto-char start)
  ;; 	 ))

