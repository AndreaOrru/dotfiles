;; Launch inferior shells on a fast shell.
(setq shell-file-name "/bin/sh")

;; Disable line highlighting in Eshell.
(add-hook 'eshell-mode-hook
	  (lambda () (setq-local global-hl-line-mode nil)))

;; Eshell prompt theme and extra info.
(require-package 'eshell-prompt-extras)
(with-eval-after-load 'esh-opt
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
	eshell-prompt-function 'epe-theme-lambda))

;; Eshell aliases.
(defun eshell/d () (dired-other-window "."))
(defalias 'eshell/e 'find-file-other-window)
(defalias 'eshell/s 'magit-status)

;; Pop an Eshell at the bottom of the frame.
(require-package 'shell-pop)
(setq
 shell-pop-full-span t
 shell-pop-shell-type '("eshell" "*eshell" (lambda nil (eshell))))

;; TMux integration.
(require-package 'tmux-pane)
(require 'tmux-pane)

;; Key bindings.
(global-set-key (kbd "s-x") 'shell-pop)
(global-set-key (kbd "M-x") 'shell-pop)

(with-eval-after-load 'eshell
  (evil-define-key 'insert eshell-mode-map (kbd "C-c") 'eshell-interrupt-process)
  (evil-define-key 'insert eshell-mode-map (kbd "C-d")
    (lambda () (interactive) (kill-buffer (current-buffer)))))

(with-eval-after-load 'evil-leader
  (evil-leader/set-key "RET" 'tmux-pane-toggle-horizontal))

(provide 'init-shell)
