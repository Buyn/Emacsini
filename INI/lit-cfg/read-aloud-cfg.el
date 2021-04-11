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
;; (setq read-aloud-engine "balcon.ru")
(lax-plist-put read-aloud-engines "bal.ru.elena"
	'(cmd "D:\\Reader\\balabolka\\balcon\\balcon.exe"
		args ( "-n" "Elena" "-i" "-enc" "utf8")))

(lax-plist-put read-aloud-engines "bal.ru.Alyona22k"
	'(cmd "D:\\Reader\\balabolka\\balcon\\balcon.exe"
		args ( "-n" "Alyona22k" "-i" "-enc" "utf8")))

(lax-plist-put read-aloud-engines "bal.ru.anna"
	'(cmd "D:\\Reader\\balabolka\\balcon\\balcon.exe"
		args ( "-n" "RHVoice Anna" "-i" "-enc" "utf8")))

(lax-plist-put read-aloud-engines "bal.ru.Irina"
	'(cmd "D:\\Reader\\balabolka\\balcon\\balcon.exe"
		args ( "-n" "Irina" "-i" "-enc" "utf8")))

(lax-plist-put read-aloud-engines "bal.ru.Katerina"
	'(cmd "D:\\Reader\\balabolka\\balcon\\balcon.exe"
		args ( "-n" "Katerina" "-i" "-enc" "utf8")))

(lax-plist-put read-aloud-engines "bal.ua.Natalia"
	'(cmd "D:\\Reader\\balabolka\\balcon\\balcon.exe"
		args ( "-n" "Natalia" "-i" "-enc" "utf8")))

(lax-plist-put read-aloud-engines "bal.en.Slt"
	'(cmd "D:\\Reader\\balabolka\\balcon\\balcon.exe"
		args ( "-n" "Slt" "-i" "-enc" "utf8")))

(lax-plist-put read-aloud-engines "bal.en.Bdl"
	'(cmd "D:\\Reader\\balabolka\\balcon\\balcon.exe"
		args ( "-n" "Bdl" "-i" "-enc" "utf8")))

(lax-plist-put read-aloud-engines "bal.en.Clb"
	'(cmd "D:\\Reader\\balabolka\\balcon\\balcon.exe"
		args ( "-n" "Clb" "-i" "-enc" "utf8")))

	(lax-plist-put read-aloud-engines "jampal.en"
		'(cmd "cscript"
					args ("D:\\Development\\lisp\\Home\\AddApps\\Jampal\\ptts.vbs" "-r" "1")))
	;; (setq read-aloud-engine "jampal.en"))
	(setq read-aloud-engine "bal.en.Slt"))
;; ** Docs
;; *** Usage 
;; M-x read-aloud-this -- pronounce either the selection or a word under the pointer.
;; M-x read-aloud-buf -- read the buffer starting from the current cursor position, highlighting the text as it moves down the buffer. Useful only for plain text files.
;; top reading at any time you either run any of the commands above again, or do M-x read-aloud-stop.
;; M-x read-aloud-change-engine -- select another engine (for this Emacs session). It also shows which one is the current.
;; *  --------------------------------------
