;;; init-local.el --- archer's config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; English translation plug
(require 'insert-translated-name)
(setq insert-translated-name-translate-engine 'google)

(require 'org)
;; org
(setq org-directory "~/books")

;; org-agenda
(setq org-agenda-files '("~/books"))

(setq org-default-notes-file (concat org-directory "/inbox.org.gpg"))

(maybe-require-package 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; org-download
(require-package 'org-download)
(require 'org-download)

;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)

;; vterm
(maybe-require-package 'vterm)

;; epa-file
(require 'epa-file)
(epa-file-enable)

;; Include .org.gpg files in org-agenda
(unless (string-match-p "\\.gpg" org-agenda-file-regexp)
  (setq org-agenda-file-regexp
        (replace-regexp-in-string "\\\\\\.org" "\\\\.org\\\\(\\\\.gpg\\\\)?"
                                  org-agenda-file-regexp)))

;; icons-font
(require-package 'all-the-icons)
;; M-x all-the-icons-install-fonts
(setq flycheck-checker-error-threshold 1000)

;; yasnippet
(require-package 'yasnippet)
(require-package 'yasnippet-snippets)

(require 'yasnippet)
(require 'yasnippet-snippets)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; The Consult package provides the command consult-line which behaves similarly to Swiper.
(global-set-key (kbd "M-s /") #'consult-line)
;; imenu
(global-set-key (kbd "M-s i") #'consult-imenu)

(provide 'init-local)
;;; init-local.el ends here
