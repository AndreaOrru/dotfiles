;; Highlight matching parenthesis.
(add-hook 'prog-mode-hook 'show-paren-mode)
;; Highlight TODO, HACK, etc.
(require-package 'hl-todo)
(add-hook 'after-init-hook 'global-hl-todo-mode)

;; Highlight the current line.
(add-hook 'after-init-hook 'global-hl-line-mode)
(after 'hl-line
  (set-face-background 'hl-line (doom-color 'base3)))
;; Disable line highlighting in Eshell.
(add-hook 'eshell-mode-hook
          #'(lambda () (setq-local global-hl-line-mode nil)))

;; Auto-highlight the symbol at point.
(require-package 'auto-highlight-symbol)
(add-hook 'after-init-hook 'global-auto-highlight-symbol-mode)
(after 'auto-highlight-symbol
  (setq ahs-case-fold-search nil
        ahs-face 'isearch
        ahs-definition-face 'isearch)
  (set-face-background 'ahs-plugin-defalt-face (face-background 'isearch))
  (set-face-foreground 'ahs-plugin-defalt-face (face-foreground 'isearch)))

(after 'evil-leader
  ;; Toggle auto-highlight.
  (evil-leader/set-key "hh" 'auto-highlight-symbol-mode)

  ;; Clear search selection and highlights.
  (evil-leader/set-key "sc" 'evil-ex-nohighlight))

(provide 'init-highlight)
