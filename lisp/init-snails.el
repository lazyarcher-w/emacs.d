;;; init-snails.el --- Snails is a modern, easy-to-expand fuzzy search framework. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path
             (expand-file-name "fuz.el" user-emacs-directory))

(add-to-list 'load-path
             (expand-file-name "snails" user-emacs-directory))

(require 'fuz)
(unless (require 'fuz-core nil t)
  (fuz-build-and-load-dymod))

(require 'snails)

(global-set-key (kbd "M-s s") 'snails)

(provide 'init-snails)
;;; init-snails.el ends here
