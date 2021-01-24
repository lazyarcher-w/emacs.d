;; init-cc.el  --- c/c++ -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(provide 'init-cc)
;;; init-cc.el ends here
