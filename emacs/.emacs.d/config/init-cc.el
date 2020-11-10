;; -*- lexical-binding: t -*-

(add-hook 'c-mode-common-hook 'lsp)
(add-hook 'c-mode-common-hook
          #'(lambda ()
              (setq c-basic-offset 2)
              (add-hook 'before-save-hook 'lsp-format-buffer t t)))

(provide 'init-cc)
