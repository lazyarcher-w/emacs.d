;;; init-local.el --- archer's config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; English translation plug
(require 'insert-translated-name)


;; org-agenda
(setq org-agenda-files '("~/org"))

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

(provide 'init-local)
;;; init-local.el ends here
