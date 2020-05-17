;; -*- lexical-binding: t -*-

(setq initial-major-mode 'emacs-lisp-mode)
(setq initial-scratch-message
      (concat ";; You can be like the common people\n"
              ";;   Or you can gather the effort\n"
              ";;      To rise above them all\n"
              ";;\n"
              ";;                 - Hafez Shirazi -\n\n"))

(require-package 'auto-package-update)  ;; Utility to update packages.
(setq disabled-command-function nil)    ;; Enable all functions.

;; Persist prescient data.
(after 'prescient
  (prescient-persist-mode 1))

;; Make clipboard work in TTY Emacs.
(require-package 'clipetty)
(unless (display-graphic-p)
  (add-hook 'after-init-hook 'global-clipetty-mode))

;; Dim text in surrounding paragraphs.
(require-package 'focus)
(defun my/focus-pin ()
  "Pin the focused section or the region, if active. Enable focus-mode if needed."
  (interactive)
  (focus-mode 1)
  (focus-pin)
  (evil-exit-visual-state))
(after 'init-evil
  (evil-leader/set-key "ff" 'focus-mode)
  (evil-leader/set-key "fp" 'my/focus-pin)
  (evil-leader/set-key "fu" 'focus-unpin)
  (evil-define-minor-mode-key 'normal 'focus-mode (kbd "C-f") 'focus-next-thing)
  (evil-define-minor-mode-key 'normal 'focus-mode (kbd "C-b") 'focus-prev-thing))

;; Google search integration.
(require-package 'google-this)
(after 'init-evil
  (which-key/describe-prefix "s" "search/selection")
  (evil-leader/set-key "sg" 'google-this-noconfirm)
  (evil-leader/set-key "sG" 'google-this-search))

;; Pastebin integration.
(require-package 'webpaste)
(after 'init-evil
  (setq webpaste-paste-confirmation t)
  (evil-leader/set-key "sp" 'webpaste-paste-region))

(provide 'init-misc)
