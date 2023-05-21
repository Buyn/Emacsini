;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/org-cfg.el")
;; --------------------------------------
;; * ORG-ROAM CUSTOMIZATION
;; --------------------------------------
;; Org-Roam basic configuration
;; (setq org-directory (concat (getenv "HOME") "/Documents/notes/"))
;;  D:\Development\lisp\Dropbox\orgs\Org-roam\default 
;;  D:/Development/lisp/Dropbox/orgs/Org-roam/default 
(use-package org-roam
	;; :disabled
	:ensure t
	:after org
	:init (setq org-roam-v2-ack t) ;; Acknowledge V2 upgrade
	:custom
	;; (org-roam-directory (file-truename org-directory))
	;; (org-roam-directory (file-truename "D:/Development/lisp/Dropbox/orgs/Org-roam/default/"))
	(org-roam-directory (file-truename "~/../Dropbox/orgs/Org-roam/default/"))
	:config
	(org-roam-setup)
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  ;; (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  ;; (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  ;; (require 'org-roam-protocol)
	:bind ( ("C-c n f" . org-roam-node-find)
					("C-c n l" . org-roam-buffer-toggle)
          ("C-c n c" . org-roam-capture)
          ("C-c n j" . org-roam-dailies-capture-today)
					(:map org-mode-map
								(("C-c n i" . org-roam-node-insert)
								("C-c n o" . org-id-get-create)
								("C-c n t" . org-roam-tag-add)
								("C-c n g" . org-roam-graph)
								;; ("C-c n r" . org-roam-node-random)		    
								("C-c n a" . org-roam-alias-add)))))


;; --------------------------------------
;; * ORG-ROAM-UI CUSTOMIZATION
(use-package org-roam-ui
	:ensure t
	;; :disabled
  ;; :straight
  ;;   (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
	:after org-roam
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
	:hook (after-init . org-roam-ui-mode)
	:config
	(setq 
				;; Org-Roam-UI can sync your Emacs theme! This is the default behavior, to disable it do
				;; org-roam-ui-sync-theme t
				org-roam-ui-sync-theme nil
				;; ORUI follows you around Emacs by default. To disable this, set
				;; org-roam-ui-follow nil
				org-roam-ui-follow t
				;; By default, org-roam-ui will try to open itself in your default browser. To disable this, set
				org-roam-ui-open-on-start nil
				org-roam-ui-update-on-save t))
;; Usage
;; Use M-x org-roam-ui-mode RET to enable the global mode. It will start a web server on http://127.0.0.1:35901/ and connect to it via a WebSocket for real-time updates.
;; --------------------------------------
;; * ------------------------------------
