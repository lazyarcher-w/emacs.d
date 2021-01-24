;;; init-lsp.el --- Language Server Protocol Support for Emacs  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'dap-mode)
(setq lsp-keymap-prefix "C-c m")

(setq lsp-enable-symbol-highlighting t)
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

(defun archer/dap-cpptools-setup ()
  ;; dap-mode configuration dap-cpptools
  (require 'dap-cpptools)
  (dap-cpptools-setup)
  (dap-register-debug-template
   "cpptools::(lldb) Launch current file"
   (list :type "cppdbg"
         :request "launch"
         :name "cpptools::Run Configuration"
         :MIMode "lldb"
         :program "${fileDirname}/${fileBasenameNoExtension}"
         :cwd "${workspaceFolder}"))
  (defun archer/dap-debug-before-cc-compile-current-file ()
    "Compile the current file before debug"
    (interactive)
    (defun archer/cc-compile-current-file-with-debug-flag ()
      (let ((command (concat "cc -g " (buffer-name) " -o " (file-name-sans-extension (buffer-name)))))
        (shell-command command)
        (message (concat "build " (buffer-name) " finish, command: " command))))
    (archer/cc-compile-current-file-with-debug-flag)
    (dap-debug (list :type "cppdbg"
                     :request "launch"
                     :name "cpptools::Run Configuration"
                     :MIMode "lldb"
                     :program "${fileDirname}/${fileBasenameNoExtension}"
                     :cwd "${workspaceFolder}"))))

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode)
  (archer/dap-cpptools-setup))

(provide 'init-lsp)
;;; init-lsp.el ends here
