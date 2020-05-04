(require-package 'flycheck)

;; Display Flycheck error list as a sticky popup.
(after 'popwin
  (push '(flycheck-error-list-mode :stick t)
        popwin:special-display-config))

(after [flycheck init-evil]
  ;; Use SPC e as prefix for Flycheck commands.
  (which-key/describe-prefix "e" "errors")
  (evil-leader/set-key "e" flycheck-command-map)
  ;; Only run syntax check on open and save.
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  ;; Use margin instead of fringe in terminal.
  (unless (display-graphic-p)
    (add-hook 'flycheck-mode-hook
              (lambda () (flycheck-set-indication-mode 'left-margin)))))

(provide 'init-flycheck)
