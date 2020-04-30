;; Install Evil and related packages.
(require-package 'evil)
(require-package 'evil-collection)
(require-package 'evil-leader)

;; Enable Evil and Evil Leader.
(add-hook 'after-init-hook 'global-evil-leader-mode)
(add-hook 'after-init-hook 'evil-mode)

;; VIM-like search with persistent highlight.
(setq-default evil-search-module 'evil-search)

;; Configure extra Evil keybindings.
(setq evil-want-keybinding nil)
(with-eval-after-load 'evil
  (evil-collection-init))

;; Custom key bindings.
(with-eval-after-load 'evil-leader
  ;; Use Space as leader key.
  (evil-leader/set-leader "<SPC>")
  ;; Clear search selection.
  (evil-leader/set-key "sc" 'evil-ex-nohighlight))

(provide 'init-evil)
