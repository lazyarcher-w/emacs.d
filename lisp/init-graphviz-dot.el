;;; init-graphviz-dot.el --- Support for the graphviz dot language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'graphviz-dot-mode)
(add-hook 'graphviz-dot-mode-hook #'company-graphviz-dot)
(add-auto-mode 'graphviz-dot-mode "\\.\\(dot\\)\\'")
(provide 'init-graphviz-dot)
;;; init-graphviz-dot.el ends here
