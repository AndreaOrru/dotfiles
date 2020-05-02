(require-package 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

;; Only run syntax check on open and save.
(defvar flycheck-check-syntax-automatically '(save mode-enabled))

(provide 'init-flycheck)
