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
;; *** Main Menu
;; **** defhydra
(defhydra spc-main-menu (:color blue)
;; ***** hint
    "
    ^
    ^main^             ^Do^             ^Menus^          
    ^─────^────────────^──^─────────────^─────^─────────
    _q_ quit            _c_ cancel      _o_ outline 
    ^^                  _d_ display
    ^^                  _e_ effort
    ^^                  _i_ in
    ^^                  _j_ jump
    ^^                  _SPC_ insert  
    ^^                  _r_ report
    ^^                  ^^
    "
;; ***** keys
    ("q" nil)
    ("c" org-clock-cancel :color pink)
    ("SPC" khaoos-insert-one-char :color pink)
    ("d" org-clock-display)
    ("e" org-clock-modify-effort-estimate)
    ("i" org-clock-in)
    ("j" org-clock-goto)
    ("o" org-clock-out)
    ("r" org-clock-report)
	("o" hydra-outline/body) 
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
(global-set-key (kbd "M-<SPC>") 'spc-main-menu/body)
;; *** hydra-zoom
;; (defhydra hydra-zoom (global-map "C-c")
;;   "zoom"
;;   ("g" text-scale-increase "in")
;;   ("l" text-scale-decrease "out"))
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
