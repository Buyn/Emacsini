(defun buyn-org-table-change ( value)
	(org-table-get-field nil (number-to-string (+ value (string-to-number (org-table-get-field))))))

(global-set-key (kbd "<f5>") '(lambda () (interactive)
																(buyn-org-table-change -1)
																(org-table-recalculate)))

(global-set-key (kbd "<f6>") '(lambda () (interactive)
																(buyn-org-table-change 1)
																(org-table-recalculate)))


