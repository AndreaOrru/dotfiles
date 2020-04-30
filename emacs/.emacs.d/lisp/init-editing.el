;; Disable autosave and backup files.
(setq-default
  auto-save-default nil
  make-backup-files nil)

;; Highlight the current line.
(add-hook 'after-init-hook 'global-hl-line-mode)

;; Intelligently clean up extra whitespaces on save.
(require-package 'whitespace-cleanup-mode)
(add-hook 'after-init-hook 'global-whitespace-cleanup-mode)

(require-package 'expand-region)        ;; Expand selected region interactively.
(require-package 'evil-nerd-commenter)  ;; Utilities for (un-)commenting.

;; Key bindings.
(with-eval-after-load 'evil-leader
  (evil-leader/set-key "v" 'er/expand-region)

  (require 'evil-nerd-commenter)
  (evil-leader/set-key ";" 'evilnc-comment-operator))

(provide 'init-editing)
