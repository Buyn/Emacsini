;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/init.el")
;; --------------------------------------
;; * HYDRA CUSTOMIZATION
;; --------------------------------------
;; ** use-package hydra
(use-package hydra :ensure t
  ;; :defer 2
  ;; :bind ("C-c c" hydra-clock/body)
;; *** END of use-package hydra
  )
;; ** Menus
;; *** Main Menu 00
;; **** defhydra
(defhydra spc-main-menu00 (:color blue)
;; ***** hint
    "
    ^Main^             00             ^Menus^          
    ^─────^───────────────────────────^─────^────────────
    _q_ quit      _d_ev menu    _o_rg-mode   _b_Org-Brain                       
    _w_ww         _SPC_ next    _y_nke-menu  _r_eader
    _p_rev-menu   _e_macs-menu  ya_s_nippet  _n_ext-menu    
    "
;; ***** keys
    ("q" nil)
    ("o" org-menu/body)
    ("d" hydra-dev-menu/body)
    ("w" www-menu/body)
    ("e" hydra-emacs-menu/body)
    ("SPC" spc-main-menu01/body )
		("y" hydra-yank-menu/body)
		("n" spc-main-menu01/body)
		("s" hydra-yasnippet/body )
		("r" hydra-reader-menu/body )
		("b" hydra-brain-org-menu/body)
		("p" spc-main-menu99/body)
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
(global-set-key (kbd "M-<SPC>") 'spc-main-menu00/body)
;; *** Main Menu 01
;; **** defhydra
(defhydra spc-main-menu01 (:color blue)
;; ***** hint
    "
    ^Main^       01        ^Menus^          
    ^────^─────────────────^─────^─────────
    _q_ quit              _o_ outline 
    _c_ calculus          _d_ ediff
    _t_ transpose         _l_it-menu
    _f_ occur-dwim        _SPC_ next    
    _p_rev-menu           _n_ext-menu    
    "
;; ***** keys
    ("q" nil)
    ("SPC" spc-main-menu98/body)
    ("c" calc)
		("o" hydra-outline/body) 
		("d" hydra-ediff/body) 
		("t" hydra-transpose/body) 
		("f" hydra-occur-dwim/body)
		("p" spc-main-menu00/body)
		("n" spc-main-menu98/body)
	  ("l" lit-menu/body)
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
;; (global-set-key (kbd "M-<SPC>") 'spc-main-menu/body)
;; *** Main Menu 99
;; **** defhydra
(defhydra spc-main-menu99 (:color blue)
;; ***** hint
    "
    ^Main^             ^99^             ^  Menus^          
    ^─────^────────────^──^─────────────^───────^─────────
    _q_uit            _i_n       _h_elp 
    ^^                _j_ump     _l_it-menu
    _p_rev-menu       _n_ext-menu    
    "
;; ***** keys
    ("q" nil)
    ("i" org-clock-in)
    ("j" org-clock-goto)
    ("o" org-clock-out)
	("h" hydra-help-menu/body)
    ;; ("r" org-clock-report)
	("n" spc-main-menu00/body)
	("p" spc-main-menu98/body)
	("l" lit-menu/body)
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
;; (global-set-key (kbd "M-<SPC>") 'spc-main-menu/body)
;; *** Main Menu 98
;; **** defhydra
(defhydra spc-main-menu98 (:color blue)
;; ***** hint
    "
    ^Main^             ^98^             ^  Menus^          
    ^─────^────────────^──^─────────────^───────^─────────
    _q_ quit         _R_evert-buffer
                    
    _p_rev-menu                     _SPC_ _n_ext-menu    
    "
;; ***** keys
  ("q" nil)
	("R" revert-buffer)
  ("SPC" spc-main-menu99/body)
	("n" spc-main-menu99/body)
	("p" spc-main-menu01/body)
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
;; (global-set-key (kbd "M-<SPC>") 'spc-main-menu/body)
;; *** hydra-zoom
(defhydra hydra-zoom (:color pink)
  ;; (global-map "C-c")
  "zoom"
  ("i" text-scale-increase "in")
  ("o" text-scale-decrease "out")
  ("p" www-menu/body "prev")
  ("q" nil "quit")
  )
;; --------------------------------------

;; *** hydra-outline
(defhydra hydra-outline (:color pink :hint nil)
;; **** Hint
  "
^Hide^             ^Show^           ^Move
^^^^^^------------------------------------------------------
_q_: sublevels     _a_: all         _u_: up
_t_: body          _e_: entry       _n_: next visible
_o_: other         _i_: children    _p_: previous visible
_c_: entry         _k_: branches    _f_: forward same level
_l_: leaves        _s_: subtree     _b_: backward same level
_d_: subtree

"
;; **** Keys
  ;; Hide
  ("q" hide-sublevels)    ; Hide everything but the top-level headings
  ("t" hide-body)         ; Hide everything but headings (all body lines)
  ("o" hide-other)        ; Hide other branches
  ("c" hide-entry)        ; Hide this entry's body
  ("l" hide-leaves)       ; Hide body lines in this entry and sub-entries
  ("d" hide-subtree)      ; Hide everything in this entry and sub-entries
  ;; Show
  ("a" show-all)          ; Show (expand) everything
  ("e" show-entry)        ; Show this heading's body
  ("i" show-children)     ; Show this heading's immediate child sub-headings
  ("k" show-branches)     ; Show all sub-headings under this heading
  ("s" show-subtree)      ; Show (expand) everything in this heading & below
  ;; Move
  ("u" outline-up-heading)                ; Up
  ("n" outline-next-visible-heading)      ; Next
  ("p" outline-previous-visible-heading)  ; Previous
  ("f" outline-forward-same-level)        ; Forward - same level
  ("b" outline-backward-same-level)       ; Backward - same level
  ("z" nil "leave")
;; (global-set-key (kbd "C-c #") 'hydra-outline/body) ; by example
;; **** END )
	)
;; --------------------------------------

;; **** bind 
;; (global-set-key (kbd "C-c #") 'hydra-outline/body) ; by example
;; --------------------------------------

;; *** hydra-ediff
(defhydra hydra-ediff (:color blue :hint nil)
  "
;; **** Hint
^Buffers           Files           VC                     Ediff regions
----------------------------------------------------------------------
_b_uffers           _f_iles (_=_)       _r_evisions              _l_inewise
_B_uffers (3-way)   _F_iles (3-way)                           _w_ordwise
_?_ help            _c_urrent file                            
"
;; **** Keys
  ("b" ediff-buffers)
  ("B" ediff-buffers3)
  ("=" ediff-files)
  ("f" ediff-files)
  ("F" ediff-files3)
  ("c" ediff-current-file)
  ("r" ediff-revision)
  ("l" ediff-regions-linewise)
  ("w" ediff-regions-wordwise)
  ("?" (info "(ediff) Introduction"))
;; **** END )
	)
;; **** doc
;; (info "(ediff) Introduction")
;; --------------------------------------

;; **** bind 
;; (global-set-key (kbd "C-c #") 'hydra-outline/body) ; by example
;; --------------------------------------

;; *** hydra-transpose
(defhydra hydra-transpose (:color red)
;; **** Hint
    "Transpose"
;; **** Keys
     ("c" transpose-chars "characters")
     ("w" transpose-words "words")
     ("o" org-transpose-words "Org mode words")
     ("l" transpose-lines "lines")
     ("s" transpose-sentences "sentences")
     ("e" org-transpose-elements "Org mode elements")
     ("p" transpose-paragraphs "paragraphs")
     ("t" org-table-transpose-table-at-point "Org mode table")
     ("q" nil "cancel" :color blue)
;; **** END )
	)
;; **** doc
;; --------------------------------------

;; **** bind 
;; (global-set-key (kbd "C-c #") 'hydra-outline/body) ; by example
;; --------------------------------------

;; *** "Apropos"
(defhydra hydra-apropos (:color blue)
  "Apropos"
;; **** Keys
  ("a" apropos "apropos")
  ("c" apropos-command "cmd")
  ("d" apropos-documentation "doc")
  ("e" apropos-value "val")
  ("l" apropos-library "lib")
  ("o" apropos-user-option "option")
  ("u" apropos-user-option "option")
  ("v" apropos-variable "var")
  ("i" info-apropos "info")
  ("t" tags-apropos "tags")
  ("z" hydra-customize-apropos/body "customize")
;; **** END )
	)
;; **** doc
;; --------------------------------------
;; **** bind 
;; (global-set-key (kbd "C-c #") 'hydra-outline/body) ; by example
;; --------------------------------------
;; **** "Apropos (customize)"
(defhydra hydra-customize-apropos (:color blue)
  "Apropos (customize)"
;; ***** Keys
  ("a" customize-apropos "apropos")
  ("f" customize-apropos-faces "faces")
  ("g" customize-apropos-groups "groups")
  ("o" customize-apropos-options "options")
;; ***** END )
  )

;; *** occur
;; **** Defuns
;; ***** Defun (defun occur-dwim ()
(defun occur-dwim ()
  "Call `occur' with a sane default, chosen as the thing under point or selected region"
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

;; ***** (defadvice occur-mode-goto-occurrence
;; Keeps focus on *Occur* window, even when when target is visited via RETURN key.
;; See hydra-occur-dwim for more options.
(defadvice occur-mode-goto-occurrence (after occur-mode-goto-occurrence-advice activate)
  (other-window 1)
  (hydra-occur-dwim/body))

;; ***** add-hook
;; Focus on *Occur* window right away.
(add-hook 'occur-hook (lambda () (other-window 1)))

;; ***** (defun reattach-occur ()
(defun reattach-occur ()
  (if (get-buffer "*Occur*")
    (switch-to-buffer-other-window "*Occur*")
    (hydra-occur-dwim/body) ))

;; **** defhydra hydra-occur-dwim 
;; Used in conjunction with occur-mode-goto-occurrence-advice this helps keep
;; focus on the *Occur* window and hides upon request in case needed later.
(defhydra hydra-occur-dwim ()
;; **** Hint
  "Occur mode"
;; **** Keys
  ("o" occur-dwim "Start occur-dwim" :color red)
  ("j" occur-next "Next" :color red)
  ("k" occur-prev "Prev":color red)
  ("h" delete-window "Hide" :color blue)
  ("r" (reattach-occur) "Re-attach" :color red)
;; **** END )
	)
;; **** doc
;; --------------------------------------
;; **** bind 
;; (global-set-key (kbd "C-x o") 'hydra-occur-dwim/body)
;; (global-set-key (kbd "C-c #") 'hydra-outline/body) ; by example
;; --------------------------------------

;; *** elpy-hydra
(defhydra elpy-hydra (:color blue)
;; **** doc
;; Two hydras for Elpy to ease the running of tests:
;;     elpy-hydra shows a menu to run the current unit test we are in with two test runners, Django and Pytest. The current virtualenv is shown in the header and we can change it (w, "workon").
;;     once the test is launched the second hydra shows a menu to navigate the errors and to switch to the compilation buffer.
;; --------------------------------------

;; **** Hint
  "
  Elpy in venv:
  "
  ;; Elpy in venv: %`venv-current-name
;; **** Keys
  ("d" (progn (call-interactively 'elpy-test-django-runner) (elpy-nav-errors/body)) "current test, Django runner" :color blue)
  ("t" (progn (call-interactively 'elpy-test-pytest-runner) (elpy-nav-errors/body)) "current test, pytest runner" :color blue)
  ("w" (venv-workon) "workon venv…")
  ("q" nil "quit")
  ("Q" (kill-buffer "*compilation*") "quit and kill compilation buffer" :color blue)
;; **** END )
	)
;; **** bind 
;; (global-set-key (kbd "C-c #") 'hydra-outline/body) ; by example
;; --------------------------------------
;; **** defhydra elpy-nav-errors
(defhydra elpy-nav-errors (:color red)
;; ***** Hint
  "
  Navigate errors
  "
;; ***** Keys
  ("n" next-error "next error")
  ("p" previous-error "previous error")
  ("s" (progn
         (switch-to-buffer-other-window "*compilation*")
         (goto-char (point-max))) "switch to compilation buffer" :color blue)
  ("w" (venv-workon) "Workon venv…")
  ("q" nil "quit")
  ("Q" (kill-buffer "*compilation*") "quit and kill compilation buffer" :color blue)
;; ***** END )
	)

;; *** yasnippet
(defhydra hydra-yasnippet ( :color pink
							;; :hint nil
							)
;; **** Hint
  "
              ^YASnippets^
--------------------------------------------
  Modes:    Load/Visit:    Actions:

 _g_lobal  _d_irectory    _i_nsert
 _m_inor   _f_ile         _t_ryout
 _e_xtra   _l_ist         _n_ew
 _q_uit    _a_ll
"
;; **** Keys
  ("d" yas-load-directory)
  ("e" yas-activate-extra-mode)
  ("i" yas-insert-snippet :color blue)
  ("w" yas-wrap-around-region :color blue)
  ("f" yas-visit-snippet-file :color blue)
  ("n" yas-new-snippet)
  ("t" yas-tryout-snippet)
  ("l" yas-describe-tables)
  ("g" yas/global-mode)
  ("m" yas/minor-mode)
  ("a" yas-reload-all)
  ("q" nil "quit")
;; **** END )
	)
;; **** doc
;; --------------------------------------

;; **** bind 
;; (global-set-key (kbd "C-c #") 'hydra-outline/body) ; by example
;; --------------------------------------
;; *** Lit menu
;; **** defhydra
(defhydra lit-menu (:color pink)
;; ***** hint
    "
                ^OrphoGrammus  Menus^ z M-=         
    ────────────^───────────────────^───────────────────
     _[_ prev err    _]_ next err    _w_ word
     _p_rev cor err  _n_ext cor err  
     _f_lyspell      _c_omment chek  _q_uit
     _a_ll buffer    _r_egion cheak
     _R_u-RU    _D_ictonar chenge    _E_n-US
    "
;; ***** keys
    ("[" evil-prev-flyspell-error :color pink)
    ("]" evil-next-flyspell-error :color pink)
    ("n" flyspell-auto-correct-word :color pink)
    ("p" flyspell-auto-correct-previous-word :color pink)
    ("f" flyspell-mode :color pink)
    ("c" flyspell-prog-mode)
    ("a" flyspell-buffer)
    ;; ("R" ispell-change-dictionary "ru_RU")
    ("R" (progn
						(ispell-change-dictionary "ru_RU")
					  (flyspell-mode t)))
    ("D" ispell-change-dictionary)
    ("E" (progn
						(ispell-change-dictionary "en_US")
					  (flyspell-mode t)))
		;; ispell-change-dictionary "en_US")
    ("r" ispell-region)
    ("w" ispell-word :color pink)
	("q" nil) 
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
(define-key evil-normal-state-map (kbd "z M-=") 'lit-menu/body)

;; *** Org menu
;; **** defun for Org menu
;; ***** mac-done-copy : 
(fset 'mac-done-copy
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("dzadd`dpza``" 0 "%d")) arg)))
;; ***** curent-time-format-hh-mm : 
(defun curent-time-format-hh-mm (p-h p-m)
  "curent-time-format-hh-mm"
	(concat
		(number-to-string (+ p-h (nth 2 (decode-time))))
		":"
		(let ((i (+ p-m (nth 1 (decode-time)))))
			(if (> i  9)
					(number-to-string i)
					(concat "0" (number-to-string i))))))
;; **** defhydra
(defhydra org-menu (:color pink)

;; ***** keys
;; ****** one-line keys
    ("r" org-archive-subtree "ARhiv TODO")
    ("t" org-todo "Todo set")
    ("g" org-agenda "aGenda" :color blue )
    ("s" org-toggle-inline-images "Show image")
		("q" nil ) 
		("o" org-roam-menu/body "Org-rOam" :color blue)
;; ****** d : 
    ("d" (progn
					  ;; (nil/body) 
						(evil-open-fold)
					  (mac-done-copy)
					  ;; (org-menu/body)
					  ) "DoneMACRO" 
							:color blue)
;; ****** h : 
    ("h" (org--deadline-or-schedule nil 'scheduled 
							 (curent-time-format-hh-mm 1 0))
					"H+1h"
					:color blue)
;; ****** n : 
    ("n" (org--deadline-or-schedule nil 'scheduled 
							 (curent-time-format-hh-mm 13 0))
					"N+13h"
					:color blue)
;; ****** b Idirect buffer : 
    ("b" (progn
						(org-tree-to-indirect-buffer)
						(define-key evil-normal-state-map (kbd "g SPC") 
							`org-tree-to-indirect-buffer))
					"BuffersInder"
					:color blue)
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
;; (define-key evil-normal-state-map (kbd "z M-=") 'lit-menu/body)
;; *** Org-roam menu
;; **** defun for Org-roam menu
;; **** defhydra
(defhydra org-roam-menu (:color blue)
;; ***** keys
;; ****** one-line keys
    ("i" org-roam-node-insert "Insert")
    ("c" org-roam-capture "Capture")
    ("g" org-roam-graph "graph")
    ("a" org-roam-alias-add "Alias Add")
		("q" nil)
		("I" org-id-get-create "Id get create")
		("f" org-roam-node-find "Find")
		("r" org-roam-buffer-toggle "Roam-buffeR")
		("j" org-roam-dailies-capture-today "joarnal")
		("t" org-roam-tag-add "tag-add")
		("R" org-roam-node-random "random")
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
;; (define-key evil-normal-state-map (kbd "z M-=") 'lit-menu/body)
;; *** emacs menu
;; **** defhydra
(defhydra hydra-emacs-menu (:color blue)
;; ***** hint
    "
                ^Emacs-mode  Menus^          
    ────────────^─────────────────^───────────────────
     To _w_in Format    To _u_nix Format _s_av-tex2reg _W_inBuffer1251
     _q_uit       _f_onts		  _R_evert buffer  _i_ns-reg2tex _m_askSlesh
    "
;; ***** keys
;; ****** w : 
    ("w" (if (eq evil-state 'visual)
								(query-replace
														"/"
														"\\"
														nil
														(region-beginning)
														(region-end)
														(current-kill 0 "DO-NOT-MOVE"))
								(query-replace
														"/"
														"\\"
														nil
														nil
														(current-kill 0 "DO-NOT-MOVE"))))
;; ****** u : 
    ("u" (if (eq evil-state 'visual)
								(query-replace
														"\\"
														"/"
														nil
														(region-beginning)
														(region-end)
														(current-kill 0 "DO-NOT-MOVE"))
								(query-replace
														"\\"
														"/"
														nil
														nil
														(current-kill 0 "DO-NOT-MOVE"))))
;; ****** m : 
    ("m" (progn
					(unless (fboundp 'mask_win_path)
							(load-file "~/keymac/mask_win_path.el"))
					(mask_win_path)))
;; ****** f : 
    ("f" hydra-emaks-fonts/body)
;; ****** R : 
	("R" revert-buffer) 
;; ****** W : 
	("W" (revert-buffer-with-coding-system 'windows-1251)) 
;; ****** q : 
	("q" nil) 
;; ****** s : 
	("s" copy-to-register :color blue) 
;; ****** i : 
	("i" insert-register :color blue) 
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
;; (define-key evil-normal-state-map (kbd "z M-=") 'lit-menu/body)

;; *** www menu
;; **** defhydra
(defhydra www-menu (:color blue)
;; ***** hint
    "
													^WWW  Menus^          
──────────────────────────^──────────^───────────────────────
_d_el buffer   _L_ist      _B_ookmarks  _v_isual  _r_enameBuf
_S_earchOtherF _s_earch    _E_WordOthrF _W_itch     _p_ast&go          
_Y_ankPageUrl  _f_rameLink              _z_oom		_q_uit    
    "
;; ***** keys
;; ****** one-line keys
    ("L" (eww-list-buffers))
    ("W" (eww-switch-to-buffer))
    ("B" (eww-list-bookmarks))
    ("v" global-visual-line-mode)
    ("f" org-open-link-in-new-frame)
    ("d" (kill-buffer (current-buffer)) :color red)
    ("z" hydra-zoom/body)
    ("r" rename-buffer)
	("q" nil) 
;; ****** "v" : 
    ("v" (progn
			;; (global-visual-line-mode t)
			(setq truncate-lines nil)
			(setq line-move-visual t)
			(setq word-wrap t)
		   )
	 )
;; ****** "s" : 
    ("s"  (
			let (buffer-name-to-close (buffer-name))
					(if (use-region-p)
						(eww (buffer-substring
								(region-beginning)
								(region-end)))
						(eww (buffer-substring
								(line-beginning-position)
								(line-beginning-position 2))))
					(switch-to-buffer buffer-name-to-close)))
;; ****** "S" : 
    ("S"  (
			let (buffer-name-to-close (buffer-name))
					(evil-window-split)
					(if (use-region-p)
						(eww (buffer-substring
								(region-beginning)
								(region-end)))
						(eww (buffer-substring
								(line-beginning-position)
								(line-beginning-position 2))))
					(evil-quit)
					(switch-to-buffer-other-frame buffer-name-to-close)))
;; ****** "E" : 
    ("E"  (
			let (buffer-name-to-close (buffer-name))
					(evil-window-split)
					(if (use-region-p)
							(eww-search-words)
						(progn 
								;; According to C-h f region-active-p, it seems that you should use use-region-p instead.
								;; EDIT: I think that rebinding the key to the new command is a cleaner approach than the advice (other commands may be relying on the original version of eww-search).
								;; (line-beginning-position)
								;; (line-beginning-position 2)
								;; (eww-search-words)))
								(eww (read-string "Query: ")))
					(evil-quit)
					(switch-to-buffer-other-frame buffer-name-to-close))))
;; ****** "Y" : 
    ("Y" (progn  
			(setq x-select-enable-clipboard t)
			(eww-copy-page-url)
			(setq x-select-enable-clipboard nil)
			))
;; ****** "p" : 
	("p" (progn  
			(setq x-select-enable-clipboard t)
			(eww (current-kill 0 "DO-NOT-MOVE"))
			(setq x-select-enable-clipboard nil)
			))
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
;; (define-key evil-normal-state-map (kbd "z M-=") 'lit-menu/body)
;; *** hydra-yank-menu
(defhydra hydra-yank-menu (:color blue)
  ;; (global-map "C-c")
  "yank menu"
  ("y" (progn  
			(setq x-select-enable-clipboard t)
			(kill-new (current-kill 0 "DO-NOT-MOVE"))
			;; (message last-clip)
			(setq x-select-enable-clipboard nil)
			)
		"reg2clipbord")
  ("s" (copy-to-buffer) "send2Buff")
  ("w" (progn  
			(setq x-select-enable-clipboard t)
			;; (find-file-other-frame "~/ELs/org-eww/org-eww.el")
			;; (require 'org-eww "~/ELs/org-eww/org-eww.el")
			(org-eww-copy-for-org-mode)
			(setq x-select-enable-clipboard nil)
			)
		"web-page2Org")
  ("q" nil "quit")
	;; --------------------------------------
  )
;; --------------------------------------


;; *** hydra-brain-org-menu
(defhydra hydra-brain-org-menu (:color blue)
  ;; (global-map "C-c")
  "Org-Brain menu"
  ("i" (org-brain-get-id)
		"addID2header")
  ("I" (org-brain-headline-to-file)
		"addID2All")
  ("v" (org-brain-visualize "index")
		"2index")
  ("V" (org-brain-entry-at-pt)
		"visualize-org")
  ("R" (org-brain-rename-file)
		"rename-file")
  ("U" (org-brain-update-id-location)
		"updateID")
  ("F" (org-brain-headline-to-file)
		"Hline2file")
  ;; ("w" (progn  
	;; 		;; (find-file-other-frame "~/ELs/org-eww/org-eww.el")
	;; 		;; (require 'org-eww "~/ELs/org-eww/org-eww.el")
	;; 		(org-eww-copy-for-org-mode)
	;; 		)
		;; "web-page2Org")
  ("q" nil "quit")
	;; --------------------------------------
  )
;; --------------------------------------


;; *** hydra-dev-menu
(defhydra hydra-dev-menu (:color red)
  ;; (global-map "C-c")
  "dev menu"
	("c" company-mode "company")
	("f" program-mode-hook-customize "fuze")
	("o" outshine-mode "outshine")
	("e" elpy-hydra/body "elpy" :color blue)
	("p" python-mode "pyton")
	("d" rainbow-delimiters-mode "delimiters")
	("l" display-line-numbers-mode "line-numbers")
	("y" hydra-yasnippet/body "yasnippet" :color blue)
	("q" nil "quit")
	)
;; --------------------------------------

;; *** hydra-help-menu
(defhydra hydra-help-menu (:color blue)
  ;; (global-map "C-c")
  "help menu"
	("a" apropos "apropos")
	("f" describe-face "describe-face")
	("q" nil "quit")
	)
;; --------------------------------------
;; *** hydra-reader-menu
(setq pixel-wait 0)
(defhydra hydra-reader-menu (:color blue)
  ;; "Reader menu spd: % 'pixel-wait"
  "Reader menu "
  ;; "Reader menu spd: %(* 10 (- 1 pixel-wait))"
;; **** r : 
	("r" (if (bound-and-true-p pixel-scroll-mode)
					(buyn-reader-end)
					(buyn-reader-start))
			  "toggle reader")
;; **** f : 
	("f" (setq pixel-wait (- pixel-wait 0.1))
					(format "faster spd:%s" (- 1 pixel-wait)) :color pink)
;; **** s : 
	("s" (setq pixel-wait (+ pixel-wait 0.1)) "slower":color pink)
;; **** t : 
	("t" read-aloud-this "aloudThis")
;; **** B : 
	("B" read-aloud-buf "aloudBuffer")
;; **** s : 
	("S" read-aloud-stop "StopAloud")
;; **** E : 
	("E" read-aloud-change-engine "AloudEngine")
;; **** q : 
	("q" nil "quit"))
;; --------------------------------------
;; *** hydra-emaks-fonts
(defhydra hydra-emaks-fonts (:color blue)
  "fonts menu "
;; **** u : 
	("u" (set-frame-font "Ubuntu Mono" nil nil)
			  "UbuntuMono")
;; **** c : 
	("c" (set-frame-font "comic sans ms" nil nil)
			  "ComicSansMS")
;; **** C : 
	("C" (set-frame-font "comic Mono" nil nil)
			  "ComicMono")
;; **** p : 
	("p" (set-frame-font "Papyrus" nil nil)
			  "Papyrus")
;; **** P : 
	("P" (set-frame-font "Comic Papyrus" nil nil)
			  "ComicPapyrus")
;; **** e : 
	("e" (set-frame-font "Edwardian Script ITC" nil nil)
			  "EdwardianS")
;; **** b : 
	("b" (set-frame-font "Bamboo" nil nil)
			  "Bamboo")
;; **** k : 
	("k" (set-frame-font "Celtic Knots" nil nil)
			  "KelticKnots")
;; **** t : 
	("t" (set-frame-font "Times New Roman" nil nil)
			  "TimesNewRoman")
;; **** q : 
	("q" nil "quit"))
;; --------------------------------------
;; *  --------------------------------------
