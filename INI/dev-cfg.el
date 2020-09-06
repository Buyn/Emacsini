;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/init.el")
;; --------------------------------------
;; --------------------------------------
;; * DEVELOPMENT-MODs CUSTOMIZATION
;; --------------------------------------
;; ** AUTOCOMPLETE-MOD CUSTOMIZATION
;; (find-file "~/INI/autocomplete-cfg.el")
(load "~/INI/autocomplete-cfg.el")
;; --------------------------------------
;; ** SNIPPETS-MOD CUSTOMIZATION
;; (find-file "~/INI/snippets-cfg.el")
(load "~/INI/snippets-cfg.el")
;; --------------------------------------
;; ** DELIMITERS-MOD CUSTOMIZATION
;; (find-file "~/INI/delimiters-cfg.el")
(load "~/INI/delimiters-cfg.el")
;; --------------------------------------
;; ** PYTHON-MOD CUSTOMIZATION
;; (find-file "~/INI/python-cfg.el") 
(load "~/INI/python-cfg.el")
;; --------------------------------------
;; ** LUA-MOD CUSTOMIZATION
;; (find-file "~/INI/lua-cfg.el")
(load "~/INI/lua-cfg.el")
;; --------------------------------------
;; ** C#-MOD CUSTOMIZATION
;; (find-file-other-frame "~/INI/dev/csharp-cfg.el")
;; (load "~/INI/dev/csharp-cfg.el")
;; --------------------------------------
;; ** CLOJURE-MODE CUSTOMIZATION
;; (find-file-other-frame "~/INI/dev/clojure-cfg.el")
(load "~/INI/dev/clojure-cfg.el")
;; --------------------------------------
;; ** UNITY CUSTOMIZATION
;; (find-file-other-frame "~/INI/dev/unity-cfg.el")
(load "~/INI/dev/unity-cfg.el")
;; --------------------------------------
;; ** JS-MOD CUSTOMIZATION
;; (load "~/INI/js-cfg.el")
;; --------------------------------------
;; ** FLYCHECK CUSTOMIZATION
(load "~/INI/flycheck-cfg.el")
;; (find-file "~/INI/flycheck-cfg.el") 
;; --------------------------------------
;; ** DEVELOPMENT SETINGS CUSTOMIZATION
(setq compilation-scroll-output nil)
;; (defun my-compilation-finish-function (buffer desc)
;;   (message "Buffer %s: %s" buffer desc)
;; 	(evil-goto-first-line)
;; 	)
;; (add-to-list 'compilation-finish-functions 'my-compilation-finish-function)
;; ** DEVELOPMENT-KEY CUSTOMIZATION
;; *** save & recompile
;; **** global-set-key <f8> :
;;  --------------------------------------
(global-set-key(kbd "<f8>") '(lambda() (interactive)
				(save-buffer)
				(evil-normal-state)
				(let ((curent-buffer (buffer-name)))
					(select-frame-by-name "*compilation*")
					(recompile)
					(select-frame-by-name curent-buffer))))				

;; (setq compilation-scroll-output nil)
;; (add-to-list 'compilation-finish-functions 'my-compilation-finish-function)
;;  --------------------------------------
;; **** global-set-key "M-<f8>" :
;;  --------------------------------------
(global-set-key(kbd "M-<f8>") '(lambda() (interactive)
								(save-buffer)
								(evil-normal-state)
								(compile
								 (read-string
										(concat
											"defult(" (buffer-name) "):")
										(buffer-file-name)
										nil
										(buffer-name)
										)
									)
								))
;; --------------------------------------
;; **** global-set-key "M-<f8>" :
;;  --------------------------------------
(define-key evil-visual-state-map (kbd "M-<f8>") '(lambda() (interactive)
								(setq region-text (buffer-substring (region-beginning) (region-end)))
								(save-buffer)
								(evil-normal-state)
								(compile
								 (read-string
										(concat
											"defult(" (buffer-name) "):")
										(concat
												(buffer-file-name)
												" -p "
												region-text
												)
										nil
										(buffer-name)
										)
									)
								))
;; --------------------------------------
;; *** --------------------------------------
;; ** PROG-MODE-HOOK CUSTOMIZATION
	(add-hook 'prog-mode-hook 
;; *** line-numbers-mode
		'display-line-numbers-mode
		;; #'outshine-mode on in outshine cfg
;; *** end prog-mode-hook
		)
;; --------------------------------------
;; *  --------------------------------------
