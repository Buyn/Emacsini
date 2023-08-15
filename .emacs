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
 '(ansi-color-faces-vector
	 [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
	 (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(custom-enabled-themes '(sanityinc-tomorrow-night))
 '(custom-safe-themes
	 '("f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(org-agenda-files
	 '("d:/Development/lisp/Dropbox/Office/Research/Doc/Grimoire/Grimoire.org" "~/../Dropbox/orgs/GTD/todo_today.org" "~/../Dropbox/orgs/GTD/todo_nottoday.org"))
 '(package-selected-packages
	 '(doom-themes hledger-mode obsidian dendroam org-roam-ui "org-roam" gnu-elpa-keyring-update org-roam aide gptel yaml-mode "org-recipes" org-recipes projectile "chess.el" "chess" ob-dot graphviz-dot-mode jedi company-jedi fb2-mode request ahk-mode evil-mc multiple-cursors go-translate popup skewer-mode read-aloud undo-fu plantuml-mode reverse-im telega sublimity minimap minimap-mode powerline company-fuzzy miracle clojure-mode expand-region hydra flycheck lua-mode elpy rainbow-delimiters yasnippet-snippets yasnippet company quelpa-use-package outshine ob-translate material-theme ivy evil-tabs better-defaults avy))
 '(safe-local-variable-values
	 '((eval let nil
					 (org-babel-goto-named-src-block "startblock")
					 (org-babel-execute-src-block))
		 (eval message "Hi from start.org")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
	 '((20 . "#f36c60")
		 (40 . "#ff9800")
		 (60 . "#fff59d")
		 (80 . "#8bc34a")
		 (100 . "#81d4fa")
		 (120 . "#4dd0e1")
		 (140 . "#b39ddb")
		 (160 . "#f36c60")
		 (180 . "#ff9800")
		 (200 . "#fff59d")
		 (220 . "#8bc34a")
		 (240 . "#81d4fa")
		 (260 . "#4dd0e1")
		 (280 . "#b39ddb")
		 (300 . "#f36c60")
		 (320 . "#ff9800")
		 (340 . "#fff59d")
		 (360 . "#8bc34a")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-active-region-background ((((background dark)) (:background "#454590" :extend t)) (t (:background "#A84708FE0FFF" :extend t))))
 '(mode-line ((t (:foreground "Black" :background "DarkOrange" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
