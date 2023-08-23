(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(

    (python . t)

    (eshell . t)

    (clojure     . t)
    (lua         . t)
    (sql        . t)
    (sqlite     . t)
    (js         . t)
    (css        . t)
    (plantuml   . t)

   ))
