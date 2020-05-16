;; -*- lexical-binding: t -*-

;; Sane defaults.
(setq-default
  auto-save-default nil  ;; Don't auto save files.
  c-basic-offset 4       ;; Use 4 spaces for indentation.
  column-number-mode t   ;; Show column number in modeline.
  create-lockfiles nil   ;; Don't create # lock files.
  make-backup-files nil  ;; Don't create ~ backup files.
  indent-tabs-mode nil   ;; Use spaces for indentation.
  tab-width 4)           ;; Show tabs as 4 spaces.

(add-hook 'after-init-hook 'global-subword-mode) ;; CamelCase words.
(add-hook 'after-init-hook 'electric-pair-mode)  ;; Insert separators in pairs.
(add-hook 'prog-mode-hook 'show-paren-mode)      ;; Highlight matching parenthesis.
;; Highlight the current line.
(add-hook 'after-init-hook 'global-hl-line-mode)
(after 'hl-line
  (set-face-background 'hl-line (doom-color 'base3)))

;; Intelligently clean up extra whitespaces on save.
(require-package 'whitespace-cleanup-mode)
(add-hook 'after-init-hook 'global-whitespace-cleanup-mode)

(require-package 'expand-region)        ;; Interactively expand region.
(require-package 'evil-nerd-commenter)  ;; Utilities for (un-)commenting.

;; Key bindings.
(after 'evil-leader
  ;; Adjust region indentation.
  (evil-define-key 'visual prog-mode-map (kbd "TAB") 'indent-region)
  (evil-leader/set-key "v" 'er/expand-region)  ;; Expand region.

  ;; Clear search selection.
  (evil-leader/set-key "sc" 'evil-ex-nohighlight)

  ;; Comment/uncomment.
  (require 'evil-nerd-commenter)
  (evil-leader/set-key ";" 'evilnc-comment-operator))

(provide 'init-editing)
