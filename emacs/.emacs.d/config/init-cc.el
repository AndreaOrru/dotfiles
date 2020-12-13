;; -*- lexical-binding: t -*-

(add-hook 'c-mode-common-hook 'lsp-deferred)
(add-hook 'c-mode-common-hook
          #'(lambda ()
              (setq c-basic-offset 2)
              (setq-local counsel-dash-docsets '("C++" "Qt"))
              (add-hook 'before-save-hook 'lsp-format-buffer t t)))

(provide 'init-cc)
