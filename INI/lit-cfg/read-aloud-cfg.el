;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/lit-cfg.el")
;; (find-file-other-frame "~/INI/lit-cfg.el") 
;; --------------------------------------
;; *  --------------------------------------
;; * READ-ALOUD-MOD CUSTOMIZATION 
;; ** load
;; (find-file-other-frame "~/INI/lit-cfg/read-aloud-cfg.el") 
(add-to-list 'load-path "~/ELs/text-to-speech/read-aloud")
;; (load "~/ELs/text-to-speech/read-aloud/read-aloud.el")
(use-package read-aloud :ensure t
  :config
	(lax-plist-put read-aloud-engines "jampal.en"
		'(cmd "cscript"
					args ("D:\\Development\\lisp\\Home\\AddApps\\Jampal\\ptts.vbs" "-r" "1")))
	(setq read-aloud-engine "jampal.en"))
;; ** Docs
;; *** Usage 
;; M-x read-aloud-this -- pronounce either the selection or a word under the pointer.
;; M-x read-aloud-buf -- read the buffer starting from the current cursor position, highlighting the text as it moves down the buffer. Useful only for plain text files.
;; top reading at any time you either run any of the commands above again, or do M-x read-aloud-stop.
;; M-x read-aloud-change-engine -- select another engine (for this Emacs session). It also shows which one is the current.
;; *  --------------------------------------
