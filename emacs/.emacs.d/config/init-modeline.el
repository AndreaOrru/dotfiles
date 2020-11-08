;; -*- lexical-binding: t -*-

;; Enable Doom modeline.
(require-package 'doom-modeline)
(add-hook 'after-init-hook 'doom-modeline-mode)

;; HACK: force the height of the modeline.
(defun my/doom-modeline-force-height (orig-fun &rest args) 32)
(after 'doom-modeline
  (advice-add 'doom-modeline--font-height :around 'my/doom-modeline-force-height))

(provide 'init-modeline)
