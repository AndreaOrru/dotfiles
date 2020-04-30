;; Install Evil and related packages.
(require-package 'evil)
(require-package 'evil-collection)
(require-package 'evil-leader)

;; Enable Evil and Evil Leader.
(add-hook 'after-init-hook 'global-evil-leader-mode)
(add-hook 'after-init-hook 'evil-mode)

;; Configure extra Evil keybindings.
(setq evil-want-keybinding nil)
(with-eval-after-load 'evil
  (evil-collection-init))
  
;; Use Space as leader key.
(with-eval-after-load 'evil-leader
  (evil-leader/set-leader "<SPC>"))

(provide 'init-evil)
