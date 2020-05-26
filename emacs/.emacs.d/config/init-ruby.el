(add-hook 'ruby-mode-hook 'lsp)

(require-package 'rbenv)
(add-hook 'ruby-mode-hook 'global-rbenv-mode)
(after 'rbenv
  (setq rbenv-show-active-ruby-in-modeline nil))

(provide 'init-ruby)
