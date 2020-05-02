(require-package 'lsp-mode)
(require-package 'lsp-ui)
(add-hook 'prog-mode-hook 'lsp-deferred)

(add-hook 'lsp-mode-hook
	  (lambda ()
	    (evil-leader/set-key "l" lsp-command-map) ;; SPC l as prefix for LSP commands.
	    (setq lsp-prefer-capf t)                  ;; Use CAPF completion (more efficient).
	    (setq lsp-keep-workspace-alive nil)))     ;; Kill language server when done.

(provide 'init-lsp)
