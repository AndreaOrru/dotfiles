;; Install packages.
(require-package 'magit)
(require-package 'evil-magit)
(require-package 'diff-hl)

;; Enable diff-hl for Git diff in the fringe.
(add-hook 'after-init-hook 'global-diff-hl-mode)
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; Follow symlinks in Git repositories.
(setq vc-follow-symlinks t)

;; Configure Evil Magit bindings.
(with-eval-after-load 'magit
  (evil-magit-init))

;; Key bindings.
(with-eval-after-load 'evil-leader
  (evil-leader/set-key "gd" 'magit-diff-working-tree)
  (evil-leader/set-key "gl" 'magit-log-all)
  (evil-leader/set-key "gs" 'magit-status)

  (evil-leader/set-key "gm" 'diff-hl-margin-mode)
  (evil-leader/set-key "[" 'diff-hl-previous-hunk)
  (evil-leader/set-key "]" 'diff-hl-next-hunk)
  (evil-leader/set-key "u" 'diff-hl-revert-hunk))

(provide 'init-git)