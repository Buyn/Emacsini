;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/init.el")
;; --------------------------------------
;; --------------------------------------
;; * EVIL-MOD CUSTOMIZATION
;; --------------------------------------
;; ** use-package evil
(use-package evil :ensure t
  ;; :defer 2
  ;; :bind ("C-c c" hydra-clock/body)
;; *** END of use-package evil
  )
(require 'evil)
(evil-mode t)
;; --------------------------------------
;; ** Setings  {{{
;; (setq evil-mode-line-format nil
;;       evil-insert-state-cursor '(bar "White")
;;       evil-visual-state-cursor '(box "#F86155"))
		(setq evil-shift-width 2)
		(setq-default evil-shift-width 2)
;; --------------------------------------
;; (define-key key-translation-map (kbd "ch") (kbd "C-h"))
;; (define-key evil-normal-state-map "c" nil)
;; (define-key evil-motion-state-map "cu" 'universal-argument)
;; -------------------------------------- }}}
;; ** Clipboard  {{{
(setq x-select-enable-clipboard nil)
;; (fset 'evil-visual-update-x-selection 'ignore)
;; (setq save-interprogram-paste-before-kill t)
;; *** M-c M-y : 
(define-key evil-normal-state-map (kbd "M-c M-y") '(lambda() (interactive)
					(setq x-select-enable-clipboard t)
					;; (kill-ring-save (region-beginning) (region-end))
					(kill-ring-save (line-beginning-position) (line-beginning-position 2))
					(setq x-select-enable-clipboard nil)))
(define-key evil-visual-state-map (kbd "M-c M-y") '(lambda() (interactive)
					(setq x-select-enable-clipboard t)
					(kill-ring-save (region-beginning) (region-end))
					(setq x-select-enable-clipboard nil)))
;; *** M-c M-Y : 
(define-key evil-normal-state-map (kbd "M-c M-Y") '(lambda() (interactive)
					(setq x-select-enable-clipboard t)
					(kill-ring-save (line-beginning-position) (line-beginning-position 2))
					(setq x-select-enable-clipboard nil)))
;; *** M-c M-a : 
(define-key evil-normal-state-map (kbd "M-c M-a") '(lambda() (interactive)
					(setq start (point))
					(mark-whole-buffer)
					(setq x-select-enable-clipboard t)
					(kill-ring-save (region-beginning) (region-end))
					(setq x-select-enable-clipboard nil)
					(message "Buffer in Clipbord")
					(goto-char start)
					))
;; *** M-c M-x : 
(define-key evil-normal-state-map (kbd "M-c M-x") '(lambda() (interactive)
					(message "no shift is prest")
					(setq x-select-enable-clipboard t)
					(setq tmp-region-beginning (region-beginning))
					;; (message "set region")
					(setq tmp-region-end (region-end))
					(kill-ring-save (region-beginning) (region-end))
					(kill-region tmp-region-beginning tmp-region-end)
					(setq tmp-region-beginning nil)
					;; (message "set region")
					(setq tmp-region-end nil)
					(setq x-select-enable-clipboard nil)
					))
;; *** M-c M-X : 
(define-key evil-normal-state-map (kbd "M-c M-X") '(lambda() (interactive)
					(message "shift is prest")
					(setq x-select-enable-clipboard t)
					(evil-delete-whole-line nil  nil)
					(setq x-select-enable-clipboard nil)
					))
;; *** M-c M-p: 
(define-key evil-normal-state-map (kbd "M-c M-p") '(lambda() (interactive)
								(setq x-select-enable-clipboard 1)
								(yank)
								(setq x-select-enable-clipboard nil)))
(define-key evil-visual-state-map (kbd "M-c M-p") '(lambda() (interactive)
		(setq x-select-enable-clipboard 1)
		(let ((last-clip (current-kill 0 "DO-NOT-MOVE")))
			(kill-region (region-beginning) (region-end))
			(insert last-clip)
			)
		(setq x-select-enable-clipboard nil)
		))
;; *** M-c M-o : 
(define-key evil-normal-state-map (kbd "M-c M-o") '(lambda() (interactive)
				(setq x-select-enable-clipboard 1)
				(evil-insert-newline-below)
				(yank)
				(setq x-select-enable-clipboard nil)))
;; *** M-c M-t : 
(define-key evil-normal-state-map (kbd "M-c M-t") '(lambda () (interactive)
				  (setq x-select-enable-clipboard
								(not x-select-enable-clipboard))
					(if x-select-enable-clipboard
						(message "x-select-enable-clipboard is on")
						(message "x-select-enable-clipboard = off"))))
;; -------------------------------------- }}}
;; *** M-p : 
(define-key evil-insert-state-map (kbd "M-p ") '(lambda() (interactive)
				(yank)))
;; -------------------------------------- }}}
;; ** Movements  {{{
(define-key evil-normal-state-map "gl" 'move-end-of-line)
(define-key evil-normal-state-map "gh" 'move-beginning-of-line)
;; (define-key evil-normal-state-map (kbd "gj") 'evil-next-visual-line)
;; (define-key evil-normal-state-map (kbd "gk") 'evil-previous-visual-line)
(define-key evil-normal-state-map  "gj" 'evil-next-visual-line)
(define-key evil-normal-state-map  "gk" 'evil-previous-visual-line)
;; --------------------------------------  }}}
;; ** Grabing  {{{
;; *** move-line : 
;; **** save-column : 
(defmacro save-column (&rest body)
  `(let ((column (current-column)))
     (unwind-protect
         (progn ,@body)
       (move-to-column column))))
(put 'save-column 'lisp-indent-function 0)
;; **** move-line-up : 
(defun move-line-up ()
	"BuYn function to move line up"
  (interactive)
  (save-column
    (transpose-lines 1)
    (forward-line -2)))

;; **** move-line-down : 
(defun move-line-down ()
	"BuYn function to move line down"
  (interactive)
  (save-column
    (forward-line 1)
    (transpose-lines 1)
    (forward-line -1)))
;; **** define-key : 
(define-key evil-normal-state-map (kbd "M-m M-k") 'move-line-up)
(define-key evil-normal-state-map (kbd "M-m M-j") 'move-line-down)
;; *** copy-lines : 
;; **** buyn-copy-line : 
(defun buyn-copy-line () (interactive)
			(setq region-text (buffer-substring (region-beginning) (region-end)))
			(save-excursion
				;; (insert " ")
				(insert region-text)
				;; (insert " :")
				))
;; **** buyn-copy-line-commented : 
(defun buyn-copy-line-commented () 
			 (interactive)
			 (let ((visual-start (region-beginning))
						 (visual-end (region-end))
						 (region-text (buffer-substring (region-beginning) (region-end))))
						(insert region-text)
						(comment-region visual-start visual-end)
						)
			 ;; (evil-next-line 2) do nothing
			 )
;; **** define-key : 
(define-key evil-visual-state-map (kbd "M-m M-p") 'buyn-copy-line)
(define-key evil-visual-state-map (kbd "M-m M-c") 'buyn-copy-line-commented)
(define-key evil-normal-state-local-map (kbd "M-m M-p") '(lambda() (interactive)
								(evil-visual-line)
								(buyn-copy-line)))
(define-key evil-normal-state-local-map (kbd "M-m M-c") '(lambda() (interactive)
								(evil-visual-line)
								(buyn-copy-line-commented)))
;; *** move-char : 
;; **** M-m M-l : 
(define-key evil-normal-state-map (kbd "M-m M-l") '(lambda() (interactive)
		(evil-delete-char (point) (+ (point) 1))				
		(evil-paste-after 1)
		))
;; **** M-m M-h : 
(define-key evil-normal-state-map (kbd "M-m M-h") '(lambda() (interactive)
		(evil-delete-char (point) (+ (point) 1))				
		(backward-char)
		(evil-paste-before 1)
		))
;FIXME: move selected
;TODO: meta m+p copy line \ selection
;; -------------------------------------- }}}
;; ** Devolopment  {{{
(define-key evil-normal-state-map (kbd "M-e M-f M-f") 'xref-find-definitions)
(define-key evil-normal-state-map (kbd "M-e M-f M-F") 'xref-find-definitions-other-frame)
(define-key evil-normal-state-map (kbd "M-e M-f M-e") 'evil-goto-definition)
(define-key evil-normal-state-map (kbd "M-e M-l") 'eval-last-sexp)
;; (define-key evil-normal-state-map (kbd "M-e M-f") 'eval-defun)
;; *** search-forward & sexp M-e M-j : 
(define-key evil-normal-state-map (kbd "M-e M-j") 
		'(lambda() (interactive)
					(move-beginning-of-line nil)
					(search-forward (char-to-string ?\)) nil nil nil)
					(unless (eq (char-after(point)) ?\))
						(backward-char 1))
					(if (eq (char-after(point)) ?\))
						(eval-last-sexp nil))
					))
;; -------------------------------------- }}}
;; ** find&replace  {{{
;; *** evil-visual <f7> : 
(define-key evil-visual-state-map (kbd "<f7>") '(lambda() (interactive)
	(let ((region-text (buffer-substring (region-beginning) (region-end))))
		(evil-normal-state)
		(query-replace
			(read-string (concat "replace("  (current-kill 0 "DO-NOT-MOVE") "):")
						nil
						nil
						(current-kill 0 "DO-NOT-MOVE"))
			region-text
			))))
;; *** evil-visual * : 
(define-key evil-visual-state-map (kbd "*") '(lambda() (interactive)
	(let ((region-text (buffer-substring (region-beginning) (region-end))))
		(evil-normal-state)
		(evil-search region-text t nil)
		(push region-text regexp-search-ring)
		)))
;; *** -------------------------------------- }}}
;; ** Wrape by one char  {{{
(define-key evil-visual-state-map (kbd "M-+") '(lambda() (interactive)
		(let (
						(start-region-beginning (region-beginning))
						(start-region-end (+ (region-end) 1))
						(char-to-wrap (read-char "enter char to wrap(/~*_+=)")))
				(unless (= char-to-wrap 27)
						(evil-normal-state)
						(goto-char start-region-beginning)
						(insert-char char-to-wrap)
						(goto-char start-region-end)
						(insert-char char-to-wrap)
						)
				)))
;; -------------------------------------- }}}
;; ** Insert State F2 save {{{
(define-key evil-insert-state-map (quote [f2]) '(lambda() (interactive)
												  (save-buffer)
								(evil-normal-state)))
(define-key evil-replace-state-map(quote [f2]) '(lambda() (interactive)
								(save-buffer)
								(evil-normal-state)))
(define-key evil-insert-state-map(kbd "M-<f2>") '(lambda() (interactive)
								(org-save-all-org-buffers)
								(save-some-buffers 'no-confirm)
								(evil-normal-state)))
(define-key evil-normal-state-map(kbd "<f2>i") '(lambda() (interactive)
								(org-save-all-org-buffers)
								(save-some-buffers 'no-confirm)
								(evil-normal-state)))
;; -------------------------------------- }}}
;; ** toggle input method in evil normal state
(define-key evil-normal-state-map(kbd "C-\\") 'toggle-input-method)
;; -------------------------------------- 
;; ** TAB on c-i
(define-key evil-insert-state-map (kbd "C-i") 'tab-to-tab-stop)
;; -------------------------------------- 
;; -------------------------------------- 
;; * EVIL COMMANDS RESPECT INPUT METHOD  
;; ** load el
;; (find-file "~/ELs/Evil/evil-respect-input.el")
(load "~/ELs/Evil/evil-respect-input.el")
;; --------------------------------------  
;; ** Rebind commands that don't respect input method
  (define-key evil-normal-state-map (kbd "r") 'khaoos-evil-replace)
  (define-key evil-motion-state-map (kbd "f") 'khaoos-evil-find-char)
  (define-key evil-motion-state-map (kbd "t") 'khaoos-evil-find-char-to)
  (define-key evil-motion-state-map (kbd "F") 'khaoos-evil-find-char-backward)
  (define-key evil-motion-state-map (kbd "T") 'khaoos-evil-find-char-to-backward)
;; --------------------------------------

;; * ONE CHAR ADD  
;; ** load el
;; (load "~/ELs/Evil/onecharadd.el")
;; (find-file "~/ELs/Evil/onecharadd.el")
;; ** Rebind commands 
;; (define-key evil-normal-state-map (kbd "SPC") 'addone-char-into-normal-evil)
(define-key evil-normal-state-map (kbd "SPC") 'khaoos-insert-one-char)
;; (define-key evil-normal-state-map (kbd "RET") 'addone-char-after-normal-evil)
(define-key evil-normal-state-map (kbd "RET") 'khaoos-append-one-char)
;; --------------------------------------  

;; * EVIL TABS  
;; ** load el
;; (find-file-other-frame "~/INI/Evil/evil-tabs-cfg.el")
(load "~/INI/Evil/evil-tabs-cfg.el")
;; *  --------------------------------------
