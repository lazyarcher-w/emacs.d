;;; init-local.el --- archer's configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; Don't downcase the returned candidates.
(when (maybe-require-package 'company)
  (setq company-dabbrev-downcase nil))


;; selectrum
(when (maybe-require-package 'consult)
  ;; The Consult package provides the command consult-line which behaves similarly to Swiper.
  (global-set-key (kbd "M-s /") 'consult-line)
  ;; imenu
  (global-set-key (kbd "M-s i") #'consult-imenu))



;; org
(with-eval-after-load 'org

  ;; epa-file
  (require 'epa-file)
  (epa-file-enable)
  ;; Solve password input problems on Mac
  (setq epa-pinentry-mode 'loopback)

  (maybe-require-package 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

  (when (maybe-require-package 'consult)
    (define-key org-mode-map (kbd "M-s i") 'consult-outline))

  (org-babel-do-load-languages 'org-babel-load-languages
                               (append org-babel-load-languages
                                       '((scheme . t))))


  (setq org-directory "~/org")

  (add-to-list 'org-capture-templates
               '("d" "diary" entry (file+datetree (lambda () (concat org-directory "/diary.org.gpg")))
                 "* %?\nEntered on %U\n  %i"))

  (setq org-default-notes-file (concat org-directory "/inbox.org.gpg"))
  (setq org-agenda-files (list org-default-notes-file
                               (concat org-directory "/gtd.org.gpg")
                               )))


;; citre
(require-package 'citre)
(require 'citre-config)
;; Bind your frequently used commands.
(global-set-key (kbd "C-x c j") 'citre-jump)
(global-set-key (kbd "C-x c J") 'citre-jump-back)
(global-set-key (kbd "C-x c p") 'citre-ace-peek)
(global-set-key (kbd "C-x c u") 'citre-update-this-tags-file)
(setq
 ;; Set this if you use project management plugin like projectile.  It's
 ;; used for things like displaying paths relatively, see its docstring.
 citre-project-root-function #'projectile-project-root
 ;; Set this if you want to always use one location to create a tags file.
 citre-default-create-tags-file-location 'global-cache
 ;; See the "Create tags file" section above to know these options
 citre-use-project-root-when-creating-tags t)


;; javascript

(when (maybe-require-package 'tide)

  (defun eslint-fix-current-file ()
    (interactive)
    (if (maybe-require-package 'projectile)
        (projectile-with-default-dir (projectile-acquire-root)
          (save-excursion
            (let ((command (concat "npx eslint --fix " (buffer-file-name))))
              (message command)
              (shell-command command))
            (revert-buffer t t)))
      (message "projectile don't install")))

  (defun setup-tide-mode ()
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    ;; configure javascript-tide checker to run after your default javascript checker
    (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
    (eldoc-mode +1)
    ;; (tide-hl-identifier-mode +1)
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    ;; `M-x package-install [ret] company`
    (define-key tide-mode-map (kbd "C-.") #'tide-jump-to-implementation)
    (define-key tide-mode-map (kbd "C-,") #'tide-references)
    (define-key tide-mode-map (kbd "C-c C-f") #'eslint-fix-current-file)
    (company-mode +1))
  ;; formats the buffer before saving
  ;; (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  (add-hook 'js-mode-hook #'setup-tide-mode))





;; lsp
(require-package 'lsp-mode)

(with-eval-after-load 'lsp-mode
  (setq lsp-ui-doc-enable nil)
  (setq lsp-eldoc-enable-hover t)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-diagnostics-provider :none)
  (setq lsp-enable-completion-at-point t)
  (setq lsp-enable-snippet t)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-file-watch-threshold 2000))

(add-hook 'lsp-mode-hook (lambda ()
                           (define-key lsp-mode-map (kbd "C-.") #'lsp-find-implementation)
                           (define-key lsp-mode-map (kbd "C-,") #'lsp-find-references)))


;; java
(require-package 'lsp-java)
(require 'lsp-java-boot)
(setq lsp-java-jdt-download-url "https://mirrors.ustc.edu.cn/eclipse/jdtls/snapshots/jdt-language-server-latest.tar.gz")
(add-hook 'java-mode-hook (lambda ()
                            (lsp)
                            (lsp-lens-mode)
                            (lsp-java-boot-lens-mode)
                            (let ((path-to-lombok (format "%s%s" (getenv "HOME") "/.m2/repository/org/projectlombok/lombok/1.18.12/lombok-1.18.12.jar")))
                              (setq-local lsp-java-vmargs
                                          `("-noverify"
                                            "-Xmx1G"
                                            "-XX:+UseG1GC"
                                            "-XX:+UseStringDeduplication"
                                            ,(concat "-javaagent:" path-to-lombok))))))
(advice-add 'lsp :before (lambda (&rest _args) (eval '(setf (lsp-session-server-id->folders (lsp-session)) (ht)))))

;; python
(require-package 'lsp-pyright)
(add-hook 'python-mode-hook (lambda ()
                              (require 'lsp-pyright)
                              (lsp)))


;; devdocs-browser
(maybe-require-package 'devdocs-browser)



;; restclient


(when (and (maybe-require-package 'restclient) (maybe-require-package 'company-restclient))
  (add-hook 'restclient-mode-hook (lambda ()
                                    (set (make-local-variable 'company-backends) '(company-restclient company-dabbrev)))))


;; separedit
(require-package 'separedit)
(define-key prog-mode-map        (kbd "C-c '") #'separedit)


;; yasnippet
(require-package 'yasnippet)
(require-package 'yasnippet-snippets)
(yas-global-mode 1)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-local)
;;; init-local.el ends here
