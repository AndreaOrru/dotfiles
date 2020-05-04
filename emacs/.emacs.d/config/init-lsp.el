;; Use LSP in all programming modes.
(require-package 'lsp-mode)
(require-package 'lsp-ui)
(add-hook 'prog-mode-hook 'lsp-deferred)

(after [lsp-mode evil]
  ;; Set \ as the LSP prefix.
  (setq lsp-keymap-prefix "\\")
  (evil-define-key '(normal visual) lsp-mode-map "\\" lsp-command-map)
  (add-hook 'lsp-mode-hook 'lsp-enable-which-key-integration)

  (setq lsp-auto-guess-root t)            ;; Guess the project root.
  (setq lsp-flycheck-live-reporting nil)  ;; Flycheck live reporting.
  (setq lsp-keep-workspace-alive nil)     ;; Kill language server when done.
  (setq lsp-prefer-capf t)                ;; Use CAPF completion (more efficient).

  ;; Format files before saving.
  (add-hook 'before-save-hook 'lsp-format-buffer))

(provide 'init-lsp)
