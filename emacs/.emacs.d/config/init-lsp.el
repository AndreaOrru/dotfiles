;; Use LSP in all programming modes.
(require-package 'lsp-mode)
(require-package 'lsp-ui)
(add-hook 'prog-mode-hook 'lsp-deferred)

(after 'lsp-mode
  ;; Enable which-key prefix descriptions.
  (setq lsp-keymap-prefix "SPC l")
  (add-hook 'lsp-mode-hook 'lsp-enable-which-key-integration)

  (setq lsp-keep-workspace-alive nil)  ;; Kill language server when done.
  (setq lsp-prefer-capf t)             ;; Use CAPF completion (more efficient).
  (setq lsp-auto-guess-root t)         ;; Guess the project root.

  ;; SPC l as prefix for LSP commands.
  (add-hook 'lsp-mode-hook
            (lambda ()
              (evil-leader/set-key "l" lsp-command-map))))

(provide 'init-lsp)
