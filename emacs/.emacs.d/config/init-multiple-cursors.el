;; -*- lexical-binding: t -*-

(require-package 'evil-mc)
(add-hook 'after-init-hook 'global-evil-mc-mode)

;; HACK: prevent evil-collection from wiping evil-mc bindings.
(after 'evil-collection
  (advice-add 'evil-collection-evil-mc-clear-keymap :around #'(lambda (&rest args))))

;; Use C-g to undo all cursors.
(defun my/keyboard-quit ()
  (interactive)
  (evil-mc-undo-all-cursors)
  (evil-force-normal-state)
  (keyboard-quit))
(after 'evil
  (evil-define-key '(normal visual) evil-mc-key-map (kbd "grq") nil)
  (evil-define-key '(normal visual insert)
    evil-mc-key-map (kbd "C-g") 'my/keyboard-quit))

(provide 'init-multiple-cursors)
