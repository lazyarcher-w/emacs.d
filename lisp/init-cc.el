;; init-cc.el  --- c/c++ -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(require-package 'eglot)
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  )


(provide 'init-cc)
;;; init-cc.el ends here
