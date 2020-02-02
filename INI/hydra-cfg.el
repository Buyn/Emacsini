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
    ^Main^             ^Do^             ^  Menus^          
    ^─────^────────────^──^─────────────^───────^─────────
    _q_ quit            _c_ cancel      _o_ outline 
    ^^                  _e_ effort      _d_ hydra-ediff
    ^^                  _i_ in          _t_ hydra-transpose
    ^^                  _j_ jump        _f_ occur-dwim
    ^^                  _SPC_ insert  
    ^^                  _r_ report
    ^^                  ^^
    "
;; ***** keys
    ("q" nil)
    ("c" org-clock-cancel :color pink)
    ("SPC" khaoos-insert-one-char :color pink)
    ("e" org-clock-modify-effort-estimate)
    ("i" org-clock-in)
    ("j" org-clock-goto)
    ("o" org-clock-out)
    ("r" org-clock-report)
	("o" hydra-outline/body) 
	("d" hydra-ediff/body) 
	("t" hydra-transpose/body) 
	("f" hydra-occur-dwim/body)
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
