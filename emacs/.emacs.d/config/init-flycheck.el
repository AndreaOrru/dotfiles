;; Enable Flycheck for all programming modes.
(require-package 'flycheck)
(add-hook 'prog-mode-hook 'global-flycheck-mode)

;; Display Flycheck error list as a sticky popup.
(after 'popwin
  (push '(flycheck-error-list-mode :stick t)
        popwin:special-display-config))

(after [flycheck init-evil]
  ;; Use SPC e as prefix for Flycheck commands.
  (which-key/describe-prefix "e" "errors")
  (evil-leader/set-key "e" flycheck-command-map)

  ;; Disable Emacs Lisp syntax checking.
  (setq flycheck-global-modes '(not emacs-lisp-mode))
  ;; Only run syntax check on open and save.
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

(provide 'init-flycheck)
