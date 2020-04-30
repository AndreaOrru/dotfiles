;; Enable Projectile.
(require-package 'projectile)
(add-hook 'after-init-hook 'projectile-mode)

(with-eval-after-load 'projectile
  (setq
   projectile-completion-system 'ivy  ;; Use Ivy for completion.
   projectile-enable-caching t))      ;; Faster file indexing.

;; Key bindings.
(with-eval-after-load 'evil-leader
  (evil-leader/set-key "p" 'projectile-command-map))

(provide 'init-projectile)
