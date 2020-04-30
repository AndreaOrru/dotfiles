;; Make it so that temporary windows don't stick around.
(require-package 'popwin)
(add-hook 'after-init-hook 'popwin-mode)
(with-eval-after-load 'popwin
  (push 'apropos-mode popwin:special-display-config))

;; Split and switch to the new window immediately.
(global-set-key (kbd "C-x 2") (lambda () (interactive) (split-window-below) (other-window 1)))
(global-set-key (kbd "C-x 3") (lambda () (interactive) (split-window-right) (other-window 1)))

(provide 'init-windows)
