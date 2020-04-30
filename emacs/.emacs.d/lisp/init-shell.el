;; Disable line highlighting in Eshell.
(add-hook 'eshell-mode-hook
	  (lambda () (setq-local global-hl-line-mode nil)))

;; Pop an Eshell at the bottom of the frame.
(require-package 'shell-pop)
(setq
 shell-pop-full-span t
 shell-pop-shell-type '("eshell" "*eshell" (lambda nil (eshell))))

(global-set-key (kbd "s-x") 'shell-pop)
(global-set-key (kbd "M-x") 'shell-pop)

;; TMux integration.
(require-package 'tmux-pane)
(require 'tmux-pane)
(with-eval-after-load 'evil-leader
  (evil-leader/set-key "RET" 'tmux-pane-toggle-horizontal))

(provide 'init-shell)
