(setq initial-scratch-message
      (concat ";; You can be like the common people\n"
	      ";;   Or you can gather the effort\n"
	      ";;      To rise above them all\n"
	      ";;\n"
	      ";;                 - Hafez Shirazi -\n\n"))

(setq inhibit-startup-screen t)    ;; Disable Emacs startup screen.
(setq ring-bell-function 'ignore)  ;; Disable audible bell.
(fset 'yes-or-no-p 'y-or-n-p)      ;; Use Y/N instead of yes/no.

;; Persist prescient data.
(with-eval-after-load 'prescient
  (prescient-persist-mode 1))

;; Key bindings.
(with-eval-after-load 'evil-leader
  (which-key/describe-prefix "h" "help")
  (evil-leader/set-key "ha" 'apropos)
  (evil-leader/set-key "hf" 'counsel-describe-function)
  (evil-leader/set-key "hk" 'describe-key)
  (evil-leader/set-key "hv" 'counsel-describe-variable))

(provide 'init-misc)
