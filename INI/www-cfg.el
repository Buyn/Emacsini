;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/init.el")
;; --------------------------------------
;; --------------------------------------
;; * EWW-MODE CUSTOMIZATION 
;; --------------------------------------
;; ** open-link-in-new-frame
;; --------------------------------------
(defun open-link-in-new-frame ()
  "open-link-in-new-frame"
  (interactive)
			(let (buffer-name-to-close (buffer-name))
				(evil-window-split)
				(eww-follow-link)
				(evil-quit)
				(switch-to-buffer-other-frame buffer-name-to-close)))
;; --------------------------------------
;; ** define-key : 
;; --------------------------------------
;; (define-key eww-link-keymap (kbd "C-<return>") 'open-link-in-new-frame)
;; (define-key eww- (kbd "C-RET") 'open-link-in-new-frame)
;; <C-return> 
;; --------------------------------------

;; ** buyn-eww-hook : 
;; --------------------------------------
;; (defun buyn-eww-hook ()
;; 		(global-visual-line-mode t))
;; (add-hook 'eww-mode-hook 'buyn-eww-hook)
;; --------------------------------------

;; *  --------------------------------------
