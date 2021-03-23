;;; init-groovy.el --- Support for Groovy -*- lexical-binding: t -*-
;;; Commentary:
;;; Get the Groovy support for Emacs from http://svn.codehaus.org/groovy/trunk/groovy/ide/emacs
;;; Copy from https://gist.github.com/matthewmccullough/1034984
;;; Code:

(require-package 'groovy-mode)

;; For some reason, these recommendations don't seem to work with Aquamacs
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
;; This does work with Aquamacs
(add-to-list 'auto-mode-alist (cons "\\.gradle\\'" 'groovy-mode))
(add-to-list 'auto-mode-alist (cons "\\.groovy\\'" 'groovy-mode))
;; This _might_ not work with Aquamacs (not sure what value it offers)
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("gradle" . groovy-mode))

(provide 'init-groovy)
;;; init-groovy.el ends here
