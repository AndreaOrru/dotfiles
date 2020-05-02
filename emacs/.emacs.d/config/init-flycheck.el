(require-package 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

(with-eval-after-load 'flycheck
  ;; Use SPC e as prefix for Flycheck commands.
  (which-key/describe-prefix "e" "errors")
  (evil-leader/set-key "e" flycheck-command-map)
  ;; Disable Emacs Lisp syntax checking.
  (setq flycheck-global-modes '(not emacs-lisp-mode))
  ;; Only run syntax check on open and save.
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

;; Display Flycheck error list as a sticky popup.
(with-eval-after-load 'popwin
  (push '(flycheck-error-list-mode :stick t)
        popwin:special-display-config))

(provide 'init-flycheck)
