;;; init-lsp.el --- Language Server Protocol Support for Emacs  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'lsp-mode)
(require-package 'lsp-ui)

(setq lsp-keymap-prefix "C-c m")

(setq lsp-enable-symbol-highlighting nil)
(setq lsp-ui-doc-enable nil)
(setq lsp-ui-doc-show-with-cursor nil)
(setq lsp-ui-doc-show-with-mouse nil)
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-show-code-actions nil)
(setq lsp-ui-sideline-show-hover nil)
(setq lsp-modeline-code-actions-enable nil)
(setq lsp-ui-sideline-show-diagnostics nil)
(setq lsp-enable-imenu t)
(setq lsp-auto-guess-root t)
(setq read-process-output-max (* 1024 1024))

(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)

(provide 'init-lsp)
;;; init-lsp.el ends here
