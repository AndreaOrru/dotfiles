;; Launch inferior shells on a fast shell.
(setq shell-file-name "/bin/sh")

;; Disable line highlighting in Eshell.
(add-hook 'eshell-mode-hook
	  (lambda () (setq-local global-hl-line-mode nil)))

;; Custom prompt.
(setq eshell-prompt-function
      (lambda ()
	(concat
	 (propertize (abbreviate-file-name (eshell/pwd)) 'face `(:foreground "blue"))
	 (propertize " λ" 'face `(:foreground "red" :weight bold))
	 (propertize " " 'face nil))))

;; Eshell aliases.
(defun eshell/d () (dired-other-window "."))
(defalias 'eshell/e 'find-file-other-window)
(defalias 'eshell/s 'magit-status)
(defalias 'eshell/x 'eshell/exit)

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
  ;; Use Emacs key bindings inside Eshell.
  (evil-set-initial-state 'eshell-mode 'emacs)
  (evil-define-key 'emacs eshell-mode-map (kbd "C-c") 'eshell-interrupt-process))

(with-eval-after-load 'evil-leader
  (evil-leader/set-key "'" 'tmux-pane-toggle-horizontal))

(provide 'init-shell)
