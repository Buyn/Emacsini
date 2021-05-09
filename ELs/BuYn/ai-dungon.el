;; * buton press
;; ** ai-dungeon-buyn-press-retry
(defun ai-dungeon-buyn-press-retry ()
  "press Retry last result to Ai dungeon"
	(skewer-eval "[...document.all].find(el => el.innerText === '󰜉').click();")
  )

;; ** ai-dungeon-buyn-press-editlast
(defun ai-dungeon-buyn-press-editlast ()
  "send Press editlast to Ai dungeon
	"
	(skewer-eval "
		[...document.all].find(el => el.innerText === '󰏫').click();
		"))
;; ** ai-dungeon-buyn-press-cancel
(defun ai-dungeon-buyn-press-cancel ()
  "send Press cancel to Ai dungeon
	"
	(skewer-eval "[...document.all].find(el => el.innerText === '󰅖').click();"))
;; ** ai-dungeon-buyn-press-send
(defun ai-dungeon-buyn-press-send ()
  "send Press Send to Ai dungeon
	"
	(skewer-eval 
		"[...document.all].find(el => el.innerText === '󰒊').click();
		"))
;; ** ai-dungeon-buyn-send-string-to-textarea
(defun ai-dungeon-buyn-send-string-to-textarea (ins-text)
  "Send string to Ai dangeon textarea
	"
	(let ((tmp-command (concat
								"document.querySelector('textarea').value='"
								ins-text
								"';")))
		(skewer-eval tmp-command)))

;; * log command
;; ** ai-dungeon-buyn-string-to-log
(defun ai-dungeon-buyn-string-to-log (ins-text)
  "send string from Ai dungeon to emaks log
	"
	(let ((tmp-command (concat
								"skewer.log('"
								ins-text
								"');")))
		(skewer-eval tmp-command)))
;; ** ai-dungeon-buyn-textarea-to-log
(defun ai-dungeon-buyn-textarea-to-log ()
  "send textarea from Ai dungeon to emaks log
	"
	(skewer-eval "skewer.log(document.querySelector('textarea').value);"))
;; ** ai-dungeon-buyn-log-the-last
(defun ai-dungeon-buyn-log-the-last ()
  "send last line from Ai dungeon to emaks log
	"
	(ai-dungeon-buyn-press-editlast)
	(ai-dungeon-buyn-textarea-to-log)
	(ai-dungeon-buyn-press-cancel))
;; * complecs commands
;; ** ai-dungeon-buyn-retry
(defun ai-dungeon-buyn-retry ()
  "Retry last result from Ai dangeon
		and send in repel log
	"
	(ai-dungeon-buyn-press-retry)
	(sit-for 4)
	(ai-dungeon-buyn-log-the-last))

;; ** ai-dungeon-buyn-continue
(defun ai-dungeon-buyn-continue ()
  "continue last result to Ai dangeon
		and send result in repel log
	"
	(ai-dungeon-buyn-press-send)
	(sit-for 4)
	(ai-dungeon-buyn-log-the-last))

;; ** ai-dungeon-buyn-corectlast
(defun ai-dungeon-buyn-corectlast ()
  "corectlast result Ai dangeon
		and send result in repel log
	"
	(setq string-text (buffer-substring (region-beginning) (region-end)))
	(evil-normal-state) 
	(ai-dungeon-buyn-send-string-to-textarea string-text)
	(ai-dungeon-buyn-press-send)
	(sit-for 4)
	(ai-dungeon-buyn-log-the-last))

;; ** ai-dungeon-buyn-send-region
(defun ai-dungeon-buyn-continue ()
  "continue last result to Ai dangeon
		and send result in repel log
	"
	(ai-dungeon-buyn-press-send)
	(sit-for 4)
	(ai-dungeon-buyn-log-the-last))

;; ** ai-dungeon-buyn-send-string
(defun ai-dungeon-buyn-send-string (string-text)
  "send string to Ai dangeon with default
		and send result in repel log
	"
	(ai-dungeon-buyn-send-string-to-textarea string-text)
	(ai-dungeon-buyn-press-send)
	(sit-for 4)
	(ai-dungeon-buyn-log-the-last))

;; * Hidra menu
;; ** defhydra
(defhydra spc-ai-dungeon-menu (:color red)
;; *** hint
    "
    _q_ quit    _j_retry    c_o_ntinue  _SPC_menu
    _l_loglast   _e_ditlast  _C_ancel  _r_etryP
    _k_orectlast
    "
;; *** keys
    ("q" nil)
    ("j" (ai-dungeon-buyn-retry))
    ("o" (ai-dungeon-buyn-continue))
    ("SPC" (spc-main-menu01/body))
    ("l" (ai-dungeon-buyn-log-the-last))
		("e" (ai-dungeon-buyn-press-editlast))
		("C" (ai-dungeon-buyn-press-cancel) )
		("r" (ai-dungeon-buyn-press-retry))
		("k" (ai-dungeon-buyn-corectlast) )
;; *** END of def
	)
;; --------------------------------------
;; ** Bind
(global-set-key (kbd "S-<SPC>") 'spc-ai-dungeon-menu/body)

