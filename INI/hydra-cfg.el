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
    ^─────^───────────────────────────^─────^─────────
    _q_ quit          _d_ev menu      _o_rg-mode                                      
    _w_ww             _SPC_ insert    _y_nke-menu 
    _p_rev-menu       _e_macs-menu    _n_ext-menu    
    "
;; ***** keys
    ("q" nil)
    ("o" org-menu/body)
    ("d" hydra-dev-menu/body)
    ("w" www-menu/body)
    ("e" hydra-emacs-menu/body)
    ("SPC" khaoos-insert-one-char :color pink)
	("y" hydra-yank-menu/body)
	("n" spc-main-menu01/body)
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
    _c_calculus           _d_ ediff
    _t_ transpose
    _f_ occur-dwim        _SPC_ insert    
    _p_rev-menu           _n_ext-menu    
    "
;; ***** keys
    ("q" nil)
    ("SPC" khaoos-insert-one-char :color pink)
    ("c" calc :color pink)
	("o" hydra-outline/body) 
	("d" hydra-ediff/body) 
	("t" hydra-transpose/body) 
	("f" hydra-occur-dwim/body)
	("p" spc-main-menu00/body)
	("n" spc-main-menu99/body)
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
    _q_ quit            _i_ in       _h_elp 
    ^^                  _j_ jump    
    _p_rev-menu         _n_ext-menu    
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
                    
    _p_rev-menu                        _n_ext-menu    
    "
;; ***** keys
    ("q" nil)
	("R" revert-buffer)
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
(defhydra elpy-hydra (:color red)
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
  ("i" yas-insert-snippet)
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
                ^OrphoGrammus  Menus^          
    ────────────^───────────────────^───────────────────
     _[_ prev err    _]_ next err    _=_ word
     _p_rev cor err  _n_ext cor err  
     _f_lyspell      _c_omment chek  _q_uit
     _a_ll buffer    _r_egion cheak
     _r_u-RU    _d_ictonar chenge    _e_n-US
    "
;; ***** keys
    ("[" evil-prev-flyspell-error :color pink)
    ("]" evil-next-flyspell-error :color pink)
    ("n" flyspell-auto-correct-word :color pink)
    ("p" flyspell-auto-correct-previous-word :color pink)
    ("f" flyspell-mode :color pink)
    ("c" flyspell-prog-mode)
    ("a" flyspell-buffer)
    ("r" ispell-change-dictionary "ru_RU")
    ("d" ispell-change-dictionary)
    ("e" ispell-change-dictionary "en_US")
    ("r" ispell-region)
    ("=" ispell-word :color pink)
	("q" nil) 
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
(define-key evil-normal-state-map (kbd "z M-=") 'lit-menu/body)

;; *** Org menu
;; **** defhydra
(defhydra org-menu (:color pink)
;; ***** hint
    "
                ^Org-mode  Menus^          
    ────────────^───────────────^───────────────────
     _d_one TODO    A_r_hiv TODO  _t_odo set
     a_g_enda   _q_uit
    "
;; ***** keys
    ("d" org-todo "DONE")
    ("r" org-archive-subtree)
    ("t" org-todo "TODO")
    ("g" org-agenda :color blue)
	("q" nil) 
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
;; (define-key evil-normal-state-map (kbd "z M-=") 'lit-menu/body)

;; *** emacs menu
;; **** defhydra
(defhydra hydra-emacs-menu (:color pink)
;; ***** hint
    "
                ^Emacs-mode  Menus^          
    ────────────^───────────────^───────────────────
     To _w_in Format    To _u_nix Format
     _q_uit
    "
;; ***** keys
;; ****** w : 
    ("w" (query-replace
								"/"
								"\\"
								nil
								nil
								(current-kill 0 "DO-NOT-MOVE"))
								)
;; ****** u : 
    ("u" (query-replace
								"\\"
								"/"
								nil
								nil
								(current-kill 0 "DO-NOT-MOVE"))
								)
;; ****** q : 
	("q" nil) 
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
    ────────────^──────────^───────────────────
     _d_el buffer   _L_ist    _B_ookmarks     _v_isual
     _s_earch       _S_witch  _p_ast&go          
     _z_oom         _q_uit    _Y_ank page url
    "
;; ***** keys
    ("L" (eww-list-buffers))
    ("S" (eww-switch-to-buffer))
    ("B" (eww-list-bookmarks))
    ("v" global-visual-line-mode)
    ("d" (kill-buffer (current-buffer)) :color red)
    ("z" hydra-zoom/body)
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
    ("s"  (progn (if (use-region-p)
					(eww (buffer-substring
							(region-beginning)
							(region-end)))
					(eww (buffer-substring
							(line-beginning-position)
							(line-beginning-position 2))))))
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
			(setq x-select-enable-clipboard nil)
			)
		"reg2clipbord")
  ("q" nil "quit")
  )
;; --------------------------------------


;; *** hydra-dev-menu
(defhydra hydra-dev-menu (:color pink)
  ;; (global-map "C-c")
  "dev menu"
	("c" company-mode "company")
	("o" outshine-mode "outshine")
	("e" elpy-hydra/body "elpy")
	("p" elpy-enable "pyton")
	("d" rainbow-delimiters-mode "delimiters")
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
