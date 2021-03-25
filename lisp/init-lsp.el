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
   "cpptools::(gdb/lldb) Launch current file"
   (list :type "cppdbg"
         :request "launch"
         :name "cpptools::Run Configuration"
         :linux (list :MIMode "gdb")
         :osx (list :MIMode "lldb")
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
                     :linux (list :MIMode "gdb")
                     :osx (list :MIMode "lldb")
                     :program "${fileDirname}/${fileBasenameNoExtension}"
                     :cwd "${workspaceFolder}"))))

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (archer/dap-cpptools-setup))

(advice-add 'lsp :before (lambda (&rest _args) (eval '(setf (lsp-session-server-id->folders (lsp-session)) (ht)))))

(setq centaur-lsp 'lsp-mode)
(when centaur-lsp
  ;; Enable LSP in org babel
  ;; https://github.com/emacs-lsp/lsp-mode/issues/377
  (cl-defmacro lsp-org-babel-enable (lang)
    "Support LANG in org source code block."
    (cl-check-type lang stringp)
    (let* ((edit-pre (intern (format "org-babel-edit-prep:%s" lang)))
           (intern-pre (intern (format "lsp--%s" (symbol-name edit-pre)))))
      `(progn
         (defun ,intern-pre (info)
           (let ((file-name (->> info caddr (alist-get :file))))
             (unless file-name
               (user-error "LSP:: specify `:file' property to enable"))

             (setq buffer-file-name file-name)
             (pcase centaur-lsp
               ('eglot
                (and (fboundp 'eglot-ensure) (eglot-ensure)))
               ('lsp-mode
                (and (fboundp 'lsp-deferred) (lsp-deferred)))
               (_ (user-error "LSP:: invalid `centaur-lsp' type")))))
         (put ',intern-pre 'function-documentation
              (format "Enable `%s' in the buffer of org source block (%s)."
                      centaur-lsp (upcase ,lang)))

         (if (fboundp ',edit-pre)
             (advice-add ',edit-pre :after ',intern-pre)
           (progn
             (defun ,edit-pre (info)
               (,intern-pre info))
             (put ',edit-pre 'function-documentation
                  (format "Prepare local buffer environment for org source block (%s)."
                          (upcase ,lang))))))))

  (defvar org-babel-lang-list
    '("go" "python" "ipython" "ruby" "js" "css" "sass" "C" "rust" "java"))
  (setq-local emacs/>=26p t)
  (add-to-list 'org-babel-lang-list (if emacs/>=26p "shell" "sh"))
  (dolist (lang org-babel-lang-list)
    (eval `(lsp-org-babel-enable ,lang))))

(provide 'init-lsp)
;;; init-lsp.el ends here
