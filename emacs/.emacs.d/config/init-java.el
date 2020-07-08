;; -*- lexical-binding: t -*-

(require-package 'lsp-java)
(add-hook 'java-mode-hook 'lsp)

(after 'lsp-java
  (setq lsp-java-server-install-dir "/usr/share/java/jdtls"))
