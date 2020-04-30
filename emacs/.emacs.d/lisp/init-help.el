;; Switch focus to newly opened help windows.
;; (setq-default help-window-select t)

;; ;; Open help buffers at the bottom.
;; (setq display-buffer-alist
;;       '(("^\\*Help\\*$" (display-buffer-reuse-window display-buffer-below-selected))
;;	("^\\*Apropos\\*$" (display-buffer-reuse-window display-buffer-below-selected))))

(require-package 'popwin)
(add-hook 'after-init-hook 'popwin-mode)

(with-eval-after-load 'popwin
  (push "*Apropos*" popwin:special-display-config))

;; Key bindings.
(with-eval-after-load 'evil-leader
  (evil-leader/set-key "hf" 'counsel-describe-function)
  (evil-leader/set-key "hk" 'describe-key)
  (evil-leader/set-key "hv" 'counsel-describe-variable))

(provide 'init-help)
