;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'pip-requirements)

(require-package 'lsp-pyright)
(add-hook 'python-mode-hook (lambda ()
                              (require 'lsp-pyright)
                              (lsp)))

(provide 'init-python)
;;; init-python.el ends here
