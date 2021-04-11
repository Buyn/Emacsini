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
 (use-package read-aloud
   :ensure t)
;; *  --------------------------------------
