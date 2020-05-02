;; Sane defaults.
(setq-default
  auto-save-default nil
  make-backup-files nil
  indent-tabs-mode nil)

;; Highlight the current line.
(add-hook 'after-init-hook 'global-hl-line-mode)
;; Highlight matching parenthesis.
(add-hook 'prog-mode-hook 'show-paren-mode)

;; Intelligently clean up extra whitespaces on save.
(require-package 'whitespace-cleanup-mode)
(add-hook 'after-init-hook 'global-whitespace-cleanup-mode)

(require-package 'expand-region)        ;; Interactively expand region.
(require-package 'evil-nerd-commenter)  ;; Utilities for (un-)commenting.

;; Key bindings.
(after 'init-evil
  (evil-leader/set-key "v" 'er/expand-region)

  ;; Clear search selection.
  (which-key/describe-prefix "s" "search")
  (evil-leader/set-key "sc" 'evil-ex-nohighlight)

  (require 'evil-nerd-commenter)
  (evil-leader/set-key ";" 'evilnc-comment-operator))

(provide 'init-editing)
