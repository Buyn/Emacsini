;; --------------------------------------
;; .emacs --- Emacs configuration
;; --------------------------------------
;; * Start of manual file
;; --------------------------------------
(load "~/INI/init.el")
;; --------------------------------------
;; ** End of manual file
;; --------------------------------------
;; --------------------------------------
;; * START OF AUTOMATION 
;; --------------------------------------
(put 'set-goal-column 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(org-agenda-files
	 '("d:/Development/lisp/Dropbox/Office/Research/Doc/Grimoire/Grimoire.org" "~/../Dropbox/orgs/GTD/todo_today.org" "~/../Dropbox/orgs/GTD/todo_nottoday.org"))
 '(package-selected-packages
	 '(hledger-mode obsidian dendroam org-roam-ui "org-roam" gnu-elpa-keyring-update org-roam aide gptel yaml-mode "org-recipes" org-recipes projectile "chess.el" "chess" ob-dot graphviz-dot-mode jedi company-jedi fb2-mode request ahk-mode evil-mc multiple-cursors go-translate popup skewer-mode read-aloud undo-fu plantuml-mode reverse-im telega sublimity minimap minimap-mode powerline company-fuzzy miracle clojure-mode expand-region hydra flycheck lua-mode elpy rainbow-delimiters yasnippet-snippets yasnippet company quelpa-use-package outshine ob-translate material-theme ivy evil-tabs better-defaults avy))
 '(safe-local-variable-values
	 '((eval let nil
					 (org-babel-goto-named-src-block "startblock")
					 (org-babel-execute-src-block))
		 (eval message "Hi from start.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-active-region-background ((((background dark)) (:background "#454590" :extend t)) (t (:background "#A84708FE0FFF" :extend t))))
 '(mode-line ((t (:foreground "Black" :background "DarkOrange" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
