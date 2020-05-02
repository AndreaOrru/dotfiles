;; Launch inferior shells on a lightweight shell.
(setq shell-file-name "/bin/sh")

;; Disable line highlighting in Eshell.
(add-hook 'eshell-mode-hook
	  (lambda () (setq-local global-hl-line-mode nil)))

(after 'eshell
  ;; Custom prompt.
  (setq eshell-prompt-regexp "^[^#\nλ]*[#λ] ")
  (setq eshell-prompt-function
        (lambda ()
          (concat
           (propertize (abbreviate-file-name (eshell/pwd)) 'face `(:foreground ,(doom-color 'cyan)))
           (propertize " λ" 'face `(:foreground ,(doom-color 'red) :weight bold))
           (propertize " " 'face nil))))

  ;; Eshell aliases.
  (defun eshell/d () (dired-other-window "."))
  (defalias 'eshell/e 'find-file-other-window)
  (defalias 'eshell/s 'magit-status)
  (defalias 'eshell/x 'eshell/exit)

  ;; Use Emacs key bindings inside Eshell.
  (evil-set-initial-state 'eshell-mode 'emacs)
  (evil-define-key 'emacs eshell-mode-map (kbd "C-c") 'eshell-interrupt-process))

;; Pop an Eshell at the bottom of the frame.
(require-package 'shell-pop)
(setq shell-pop-full-span t
      shell-pop-shell-type '("eshell" "*eshell" (lambda nil (eshell))))
(global-set-key (kbd "s-x") 'shell-pop)
(global-set-key (kbd "M-x") 'shell-pop)

;; TMux integration.
(require-package 'tmux-pane)
(after 'evil-leader
  (require 'tmux-pane)
  (evil-leader/set-key "'" 'tmux-pane-toggle-horizontal))

(provide 'init-shell)
