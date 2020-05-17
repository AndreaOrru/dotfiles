;; -*- lexical-binding: t -*-

(require-package 'lsp-mode)
(require-package 'lsp-ivy)
(require-package 'lsp-ui)

(after [lsp-mode init-evil]
  (setq lsp-auto-guess-root t              ;; Guess the project root.
        lsp-enable-snippet nil             ;; Disable Yasnippet.
        lsp-flycheck-live-reporting nil    ;; Disable Flycheck live reporting.
        lsp-keep-workspace-alive nil       ;; Kill language server when done.
        lsp-prefer-capf t                  ;; Use CAPF completion (more efficient).
        lsp-ui-doc-enable nil)             ;; Disable documentation on hover.

  (setq lsp-keymap-prefix ",")
  (add-hook 'lsp-mode-hook
            #'(lambda ()
                ;; Enable the LSP prefix for LSP-enabled buffers.
                (lsp-enable-which-key-integration)
                (evil-local-set-key 'normal (kbd ",") lsp-command-map)
                (evil-local-set-key 'visual (kbd ",") lsp-command-map)))

  (after 'lsp-ui
    ;; Extra commands.
    (define-key lsp-command-map (kbd ",") 'lsp-ui-doc-glance)
    (define-key lsp-command-map (kbd ">") 'lsp-ivy-workspace-symbol)
    (define-key lsp-command-map (kbd "i") 'lsp-ui-imenu)
    ;; VIM-like bindings for peek mode.
    (define-key lsp-ui-peek-mode-map (kbd "C-j") 'lsp-ui-peek--select-next)
    (define-key lsp-ui-peek-mode-map (kbd "j") 'lsp-ui-peek--select-next)
    (define-key lsp-ui-peek-mode-map (kbd "C-k") 'lsp-ui-peek--select-prev)
    (define-key lsp-ui-peek-mode-map (kbd "k") 'lsp-ui-peek--select-prev)))


(provide 'init-lsp)
