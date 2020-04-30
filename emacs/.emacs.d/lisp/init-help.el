;; Display help windows inside popups.
(require-package 'popwin)
(add-hook 'after-init-hook 'popwin-mode)
(with-eval-after-load 'popwin
  (push 'apropos-mode popwin:special-display-config))

;; Key bindings.
(with-eval-after-load 'evil-leader
  (evil-leader/set-key "hf" 'counsel-describe-function)
  (evil-leader/set-key "hk" 'describe-key)
  (evil-leader/set-key "hv" 'counsel-describe-variable))

(provide 'init-help)
