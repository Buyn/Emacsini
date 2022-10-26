(fset 'calc-all
   (kmacro-lambda-form [?\C-u ?\C-c ?*] 0 "%d"))
(global-set-key (kbd "<f5>") 'calc-all)
