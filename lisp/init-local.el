;;; init-local.el --- archer's config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; theme
(load-theme 'sanityinc-solarized-light nil)

;; English translation plug
(require 'insert-translated-name)

;; org
(setq org-directory "~/org")

;; org-agenda
(setq org-agenda-files '("~/org"))

;; Setting up org-capture
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; org-publish
(require 'ox-publish)
(setq org-publish-project-alist '(
                                  ("org-notes"
                                   :base-directory "~/org"
                                   :base-extension "org"
                                   :publishing-directory "~/public_html/"
                                   :recursive t
                                   :publishing-function org-html-publish-to-html
                                   :headline-levels 4 ;; Just the default for this project.
                                   )
                                  ("org-static"
                                   :base-directory "~/org"
                                   :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
                                   :publishing-directory "~/public_html/"
                                   :recursive t
                                   :publishing-function org-publish-attachment
                                   )

                                  ("org" :components ("org-notes" "org-static"))

                                  )
      )

;; eaf
;; (when *is-a-linux*
;;   (add-to-list 'load-path "~/code/emacs-application-framework")
;;   (require 'eaf)
;;   (setq eaf-find-alternate-file-in-dired t)
;;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scrool_down "C-p" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key take_photo "p" eaf-camera-keybinding))

(provide 'init-local)
;;; init-local.el ends here
