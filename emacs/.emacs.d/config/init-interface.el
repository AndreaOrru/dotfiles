;; -*- lexical-binding: t -*-

;; Disable GUI elements.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Load theme.
(setq custom-safe-themes t)
(require-package 'doom-themes)
(load-theme 'doom-tomorrow-night)

;; Set interface font.
(setq default-frame-alist '((font . "Iosevka Fixed SS09 Extended-14")))
(setq-default line-spacing 3)
;; Make the fringe bigger.
(fringe-mode '(16 . 0))

;; Start GUI in fullscreen mode.
(when (display-graphic-p)
  (toggle-frame-fullscreen))

;; Show clearer window dividers.
(if (not (display-graphic-p))
    (set-face-attribute 'vertical-border nil
                        :background (doom-color 'base2)
                        :foreground (doom-color 'base2))
  (setq window-divider-default-places t
        window-divider-default-bottom-width 4
        window-divider-default-right-width 3)
  (add-hook 'after-init-hook 'window-divider-mode))

;; Enable mouse in terminal.
(unless (display-graphic-p)
  (xterm-mouse-mode 1))
;; Enable smooth scrolling.
(setq mouse-wheel-progressive-speed nil
      scroll-preserve-screen-position t
      scroll-margin 0
      scroll-conservatively 101)

(setq inhibit-startup-screen t)    ;; Disable Emacs startup screen.
(setq ring-bell-function 'ignore)  ;; Disable audible bell.
(fset 'yes-or-no-p 'y-or-n-p)      ;; Use Y/N instead of yes/no.

(provide 'init-interface)
