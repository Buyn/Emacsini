;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; ORIGAMI-MOD CUSTOMIZATION
;; TRIPLE-BRACES CUSTOMIZATION
;; --------------------------------------
(defun triple-braces-forward-togle ()
	"trying to find triple-braces in line 
	and open it
	if no found then use standart origami standart forward togling"
  (interactive)
  ;; (if (equal major-mode 'org-mode)
		;; (org-cycle)
	(save-excursion ;; leave point where it is
		(if (search-forward "{{{" (line-end-position) t) ;fo1x in or out
			(origami-toggle-node (current-buffer) (point))
			(origami-toggle-node (current-buffer) (point)))
		;; (goto-char (point-at-eol)) ;; then go to the end of line
		;; (search-forward "fox") ;fo1x in or out
		;; (origami-toggle-node (current-buffer) (point))
		;; and try to fold
		;; (origami-forward-toggle-node)
		))
  

(message "load togler")
(defun triple-braces-create-and-comment-on-rigion ()
		"create fold and add comment to it
		 on sellected region"
	 (interactive)
	 (setq start (region-beginning))
	 (setq end (region-end))
	 (deactivate-mark)
	 (and (< end start)
		  (setq start (prog1 end (setq end start))))
	 (goto-char start)
	 (beginning-of-line)
	 (indent-according-to-mode)
	 (insert comment-start)
	 (setq start (point))
	 (insert "  {{{")
	 (newline-and-indent)
	 (goto-char end)
	 (forward-line 2)
	 (end-of-line)
	 (newline-and-indent)
	 (and (not (bolp))
		  (eq 0 (forward-line))
		  (eobp)
		  (insert ?\n))
	 (indent-according-to-mode)
	 (if (equal comment-end "")
		 (insert comment-start "  }}}")
	   (insert comment-end "}}}"))
	 ;; (newline-and-indent)
	 (goto-char start)
	 )

(defun triple-braces-create-and-comment-on-line-end ()
	 "create folding and add comment to it
		on line end"
	 (interactive)
	 (end-of-line) 
	 (insert comment-start)
	 ;; (indent-according-to-mode)
	 (setq start (point))
	 (insert " " " {{{")
	 (newline-and-indent)
	 (indent-according-to-mode)
	 (if (equal comment-end "")
		 (insert comment-start " }}}")
	   (insert comment-end "}}}"))
	 (goto-char start)
	 )
