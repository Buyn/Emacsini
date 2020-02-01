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
    ^main^             ^Do^
    ^─────^─────────────^──^─────────
    _q_ quit            _c_ cancel
    _SPC_                _d_ display
    ^^                  _e_ effort
    ^^                  _i_ in
    ^^                  _j_ jump
    ^^                  _o_ out
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
;; ***** END of def
	)
;; --------------------------------------
;; **** Bind
(global-set-key (kbd "M-<SPC>") 'spc-main-menu/body)
;; *** hydra-zoom
(defhydra hydra-zoom (global-map "C-c")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))
;; --------------------------------------
