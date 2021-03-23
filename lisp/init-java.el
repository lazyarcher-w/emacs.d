;;; init-java.el --- Support for Java -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'lsp-java)
(require 'lsp-java)
(require 'lsp-java-boot)
;; (setq lsp-java--download-root "http://localhost:8000/install/")
;; (setq lsp-java-jdt-download-url "https://mirrors.ustc.edu.cn/eclipse/jdtls/snapshots/jdt-language-server-latest.tar.gz")

(let ((path-to-lombok "/home/archer/.m2/repository/org/projectlombok/lombok/1.18.12/lombok-1.18.12.jar"))
  (setq lsp-java-vmargs
        `("-noverify"
          "-Xmx1G"
          "-XX:+UseG1GC"
          "-XX:+UseStringDeduplication"
          ,(concat "-javaagent:" path-to-lombok))))

;; to enable the lenses
(add-hook 'java-mode-hook #'lsp)
(add-hook 'lsp-mode-hook #'lsp-lens-mode)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

(provide 'init-java)
;;; init-java.el ends here
