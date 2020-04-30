;; Key bindings.
(with-eval-after-load 'evil-leader
  (evil-leader/set-key "ha" 'apropos)
  (evil-leader/set-key "hf" 'counsel-describe-function)
  (evil-leader/set-key "hk" 'describe-key)
  (evil-leader/set-key "hv" 'counsel-describe-variable))

(provide 'init-help)
