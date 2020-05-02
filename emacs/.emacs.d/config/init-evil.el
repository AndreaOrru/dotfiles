;; Evil mode.
(require-package 'evil)
(add-hook 'after-init-hook 'evil-mode)

;; VIM-like search with persistent highlight.
(setq-default evil-search-module 'evil-search)
(setq evil-want-C-i-jump nil)  ;; Fix TAB inside Org mode.

;; Collection of extra Evil keybindings.
(require-package 'evil-collection)
(setq evil-want-keybinding nil)
(after 'evil
  (setq evil-collection-company-use-tng nil)  ;; Use standard Company completion.
  (evil-collection-init))

;; Use s for surround and S for substitute.
(require-package 'evil-surround)
(after 'evil
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-substitute))

;; Use Space as leader key.
(require-package 'evil-leader)
(add-hook 'after-init-hook 'global-evil-leader-mode)
(after 'evil-leader
  (evil-leader/set-leader "SPC"))

;; Use which-key to display available key bindings.
(require-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)
(after 'evil
  (require 'evil-leader)
  (defun which-key/describe-prefix (prefix description)
    "Assign a which-key DESCRIPTION to a evil-leader PREFIX."
    (which-key-add-key-based-replacements
      (concat evil-leader/leader " " prefix) description)))

(provide 'init-evil)
