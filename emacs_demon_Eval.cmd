set HOME=D:\Development\lisp\HOME\ 
rem D:\Development\lisp\Emacs\bin\runemacs.exe %*
rem D:\Development\lisp\Emacs\bin\runemacs.exe -q --daemon -s "" %*
emacs -e '(setq server-name "my-special-server")' --daemon
