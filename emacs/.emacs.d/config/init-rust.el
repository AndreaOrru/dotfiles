(require-package 'rustic)
(after 'rustic
  ;; HACK: waiting for https://github.com/brotzeit/rustic/issues/112 to be fixed.
  (flycheck-define-checker rustic-clippy
    "A Rust syntax checker using clippy.

See URL `https://github.com/rust-lang-nursery/rust-clippy'."
    :command ("cargo" "clippy" "-Zunstable-options" "--message-format=json")
    :error-parser flycheck-parse-cargo-rustc
    :error-filter flycheck-rust-error-filter
    :error-explainer flycheck-rust-error-explainer
    :modes rustic-mode
    :predicate flycheck-buffer-saved-p
    :enabled (lambda ()
               (and (flycheck-rust-cargo-has-command-p "clippy")
                    (flycheck-rust-manifest-directory)))
    :working-directory (lambda (_) (flycheck-rust-manifest-directory))
    :verify
    (lambda (_)
      (and buffer-file-name
           (let ((has-toml (flycheck-rust-manifest-directory))
                 (has-clippy (flycheck-rust-cargo-has-command-p "clippy")))
             (list
              (flycheck-verification-result-new
               :label "Clippy"
               :message (if has-clippy "Found"
                          "Cannot find the `cargo clippy' command")
               :face (if has-clippy 'success '(bold warning)))
              (flycheck-verification-result-new
               :label "Cargo.toml"
               :message (if has-toml "Found" "Missing")
               :face (if has-toml 'success '(bold warning))))))))

  (add-hook 'rustic-mode-hook
            #'(lambda ()
                (add-to-list 'flycheck-disabled-checkers 'lsp)
                (add-to-list 'flycheck-checkers 'rustic-clippy)
                (flycheck-select-checker 'rustic-clippy)))
  (setq rustic-lsp-server 'rust-analyzer)
  (setq rustic-format-on-save t))

(provide 'init-rust)
