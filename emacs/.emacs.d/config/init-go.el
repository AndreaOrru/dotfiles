;; -*- lexical-binding: t -*-

(require-package 'go-mode)
(add-hook 'go-mode-hook 'lsp)

(add-hook 'go-mode-hook
          #'(lambda ()
              ;; Jump to definition in another window.
              (evil-local-set-key 'normal (kbd "gD") 'godef-jump-other-window)
              ;; Format code on saving.
              (add-hook 'before-save-hook 'lsp-format-buffer t t)
              (add-hook 'before-save-hook 'lsp-organize-imports t t))
          98)

;; Recenter screen after jumping to definition.
(advice-add
 'godef-jump :after
 #'(lambda (orig-fun &rest args) (recenter)))

(provide 'init-go)
