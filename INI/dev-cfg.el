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
;; ** JS-MOD CUSTOMIZATION
;; (load "~/INI/js-cfg.el")
;; --------------------------------------
;; ** FLYCHECK CUSTOMIZATION
(load "~/INI/flycheck-cfg.el")
;; (find-file "~/INI/flycheck-cfg.el") 
;; --------------------------------------
;; ** DEVELOPMENT-KEY CUSTOMIZATION
;; *** save & recompile
(global-set-key(kbd "<f7>") '(lambda() (interactive)
								(save-buffer)
								(evil-normal-state)
								(with-current-buffer "*compilation*"
										(recompile))
								(delete-other-windows)
								))
(global-set-key(kbd "M-<f7>") '(lambda() (interactive)
								(save-buffer)
								(evil-normal-state)
								(compile
								 (read-string
										(concat
														"defult("
														(buffer-name)
														"):"
														)
										nil
										nil
										(buffer-name))
									)
								))
;; --------------------------------------
;; *  --------------------------------------
