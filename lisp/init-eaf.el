;;; init-eaf.el --- emacs-application-framework  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "emacs-application-framework" user-emacs-directory))
(require 'eaf)

(setq browse-url-browser-function 'eaf-open-browser)
(defalias 'browse-web #'eaf-open-browser)
(global-set-key (kbd "M-s M-w") 'eaf-search-it)

(setq eaf-proxy-type "socks5")
(setq eaf-proxy-host "127.0.0.1")
(setq eaf-proxy-port "1080")

(provide 'init-eaf)
;;; init-eaf.el ends here
