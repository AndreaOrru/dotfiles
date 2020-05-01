;; Install Evil and related packages.
(require-package 'evil)
(require-package 'evil-collection)
(require-package 'evil-leader)
(require-package 'evil-surround)

;; Enable Evil and Evil Leader.
(add-hook 'after-init-hook 'global-evil-leader-mode)
(add-hook 'after-init-hook 'evil-mode)

;; VIM-like search with persistent highlight.
(setq-default evil-search-module 'evil-search)

;; Configure extra Evil keybindings.
(setq evil-want-keybinding nil)
(with-eval-after-load 'evil
  (setq evil-collection-company-use-tng nil)  ;; Use standard Company completion.

  ;; Use s for surround and S for substitute.
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-substitute)

  (evil-collection-init))

;; Custom key bindings.
(with-eval-after-load 'evil-leader
  ;; Use Space as leader key.
  (evil-leader/set-leader "<SPC>")
  ;; Clear search selection.
  (evil-leader/set-key "sc" 'evil-ex-nohighlight))

(provide 'init-evil)
