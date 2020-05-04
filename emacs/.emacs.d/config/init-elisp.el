(after 'init-evil
  ;; Shortcut for evaluating region.
  (evil-define-key 'visual emacs-lisp-mode-map (kbd ",e") 'eval-region)
  (evil-define-key '(normal visual) emacs-lisp-mode-map (kbd ",p") 'check-parens)

  ;; Find help for symbol at point.
  (evil-leader/set-key "hh"
    (lambda () (interactive) (describe-symbol (symbol-at-point)))))

(provide 'init-elisp)
