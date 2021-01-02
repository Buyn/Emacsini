;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/interface/powerline-cfg.el")
;; --------------------------------------
;; * REVERSE-IM CUSTOMIZATION: 
;; --------------------------------------
;; ** install
;; https://github.com/a13/reverse-im.el
(use-package reverse-im
  :ensure t
  :custom
  (reverse-im-input-methods '("russian-computer"))
  :config
  (reverse-im-mode t))
;; --------------------------------------
;; *  --------------------------------------
