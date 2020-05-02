(require-package 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

(with-eval-after-load 'flycheck
  ;; Disable Emacs Lisp syntax checking.
  (setq flycheck-global-modes '(not emacs-lisp-mode))
  ;; Only run syntax check on open and save.
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

(provide 'init-flycheck)
