;; Use LSP in all programming modes.
(require-package 'lsp-mode)
(require-package 'lsp-ui)
(add-hook 'prog-mode-hook 'lsp-deferred)

(after [lsp-mode init-evil]
  ;; Format files before saving.
  (add-hook 'before-save-hook 'lsp-format-buffer)

  (setq lsp-auto-guess-root t)            ;; Guess the project root.
  (setq lsp-flycheck-live-reporting nil)  ;; Disable Flycheck live reporting.
  (setq lsp-keep-workspace-alive nil)     ;; Kill language server when done.
  (setq lsp-prefer-capf t)                ;; Use CAPF completion (more efficient).

  (setq lsp-keymap-prefix ",")
  (add-hook 'lsp-mode-hook
            (lambda ()
              ;; Enable the LSP prefix for LSP-enabled buffers.
              (lsp-enable-which-key-integration)
              (evil-local-set-key 'normal (kbd ",") lsp-command-map)
              (evil-local-set-key 'visual (kbd ",") lsp-command-map)
              ;; Use LSP for jump to definition.
              (evil-local-set-key 'normal (kbd "gd") 'lsp-find-definition)
              (evil-local-set-key 'visual (kbd "gd") 'lsp-find-definition)))

  ;; VIM-like bindings for peek mode.
  (after 'lsp-ui
    (define-key lsp-ui-peek-mode-map (kbd "C-j") 'lsp-ui-peek--select-next)
    (define-key lsp-ui-peek-mode-map (kbd "j") 'lsp-ui-peek--select-next)
    (define-key lsp-ui-peek-mode-map (kbd "C-k") 'lsp-ui-peek--select-prev)
    (define-key lsp-ui-peek-mode-map (kbd "k") 'lsp-ui-peek--select-prev)))


(provide 'init-lsp)
