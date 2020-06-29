;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/init.el")
;; --------------------------------------
;; * BUYN's ELISP DEFUNS
;; --------------------------------------
;; ** varibls
(setq path-to-emagus-cmd "D:/Development/lisp/HOME/emacs_Run.cmd") 
;; ** functions
;; *** buyn-start-emagus :
(defun buyn-start-emagus (unix-path-to-file)
  "	buyn start new emacs process
		as parametr  
		get file path in unix format
		unix-path-to-file path to file in unix format
		"
  (shell-command
	;; (message
	 (concat path-to-emagus-cmd
					 " "
					 unix-path-to-file)
		)
  )

;; *** buyn-start-emagus-win : 
(defun buyn-start-emagus-win (win-path-to-file)
   "	buyn start new emacs process
		as parametr  
		get file path in Windos format
		win-path-to-file path to file in unix format
		"
		;; (message (replace-regexp-in-string "/" (regexp-quote "\\") win-path-to-file t t))
(buyn-start-emagus
	;; (message 
 (replace-regexp-in-string "\\\\" "/" win-path-to-file t t)
 )
		;; (message (replace-regexp-in-string "\\\\" "/" win-path-to-file t t ))
;; (replace-regexp-in-string "/" "\\" path t t)
		;; (replace-string "f" win-path-to-file)
		;; (message win-path-to-file)
		)

;; *  --------------------------------------
