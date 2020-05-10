;; -*- lexical-binding: t -*-

;; Enable Doom modeline.
(require-package 'doom-modeline)
(add-hook 'after-init-hook 'doom-modeline-mode)

;; Reduce the size of the icons.
(setq-default all-the-icons-scale-factor 1.0)

;; HACK: force the height of the modeline.
(defun my/doom-modeline-force-height (orig-fun &rest args) 28)
(advice-add 'doom-modeline--font-height :around #'my/doom-modeline-force-height)

(provide 'init-modeline)
