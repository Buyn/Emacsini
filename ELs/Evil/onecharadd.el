(defun addone-char-into-normal-evil()
    "add one char into normal evil"
    (interactive)
    (setq chartoadd (read-char "enter char"))
    (insert chartoadd))

(defun addone-char-after-normal-evil()
    "add one char after normal evil"
    (interactive)
    (setq chartoadd (read-char "enter char"))
    (save-excursion (insert chartoadd)))
    ;;(save-excursion (insert chartoadd)))
