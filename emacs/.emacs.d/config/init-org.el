;; -*- lexical-binding: t -*-

(require-package 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)

(setq inhibit-compacting-font-caches t)

(provide 'init-org)
