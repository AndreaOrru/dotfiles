(add-hook 'ruby-mode-hook 'lsp)

(require-package 'rbenv)
(add-hook 'ruby-mode-hook
          #'(lambda ()
              (add-hook 'before-save-hook 'lsp-format-buffer t t)
              (global-rbenv-mode)))

(after 'rbenv
  (setq rbenv-show-active-ruby-in-modeline nil))

(provide 'init-ruby)
