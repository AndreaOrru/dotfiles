(require-package 'rustic)
(after 'rustic
  (setq rustic-lsp-server 'rust-analyzer)
  (setq lsp-rust-analyzer-cargo-watch-command "clippy")
  (setq rustic-format-on-save t))

(after 'init-docs
  (add-hook 'rustic-mode-hook
            #'(lambda () (setq-local counsel-dash-docsets '("Rust")))))

(provide 'init-rust)
