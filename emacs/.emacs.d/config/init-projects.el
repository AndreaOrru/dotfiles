;; Enable Projectile.
(require-package 'projectile)
(add-hook 'after-init-hook 'projectile-mode)

(after 'projectile
  (setq
   projectile-completion-system 'ivy  ;; Use Ivy for completion.
   projectile-enable-caching t))      ;; Faster file indexing.

(defun edit-dotemacs ()
  "Open the directory of the current Emacs configuration."
  (interactive)
  (find-file (expand-file-name "config" user-emacs-directory)))

;; Key bindings.
(after 'init-evil
  (evil-leader/set-key "fe" 'edit-dotemacs)

  (which-key/describe-prefix "p" "projects")
  (evil-leader/set-key "p" 'projectile-command-map))

(provide 'init-projects)
